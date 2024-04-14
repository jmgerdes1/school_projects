program main
    integer :: nx, nt
    real*8 :: dx = 0.01d0, dt=0.00002d0, E0 = 0.1d0, junk, trap, w, sig = 45.d0, normcheck, t
    real*8 :: E(4) = (/-11.652499999999566,-9.1574999999982900,-5.1937499999982570,-0.52499999999821312/)
    real*8, allocatable, dimension(:,:) :: psi, d
    complex*16, allocatable, dimension(:,:) :: c
    complex*16 ci/(0.0,1.0)/
    nx = int(20/dx)
    nt = int(200/dt)
    allocate(d(4,4), psi(4,-nx:nx),c(4,-nt:nt))

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!               Reading From File               !
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    
    open(100,file="dat/q2_1.dat")
    open(101,file="dat/q2_2.dat")
    open(102,file="dat/q2_3.dat")
    open(103,file="dat/q2_4.dat")

    do i=-nx,nx
        read(100,*) junk, psi(1,i)
        read(101,*) junk, psi(2,i)
        read(102,*) junk, psi(3,i)
        read(103,*) junk, psi(4,i)
    end do
    close(100);close(101);close(102);close(103)

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!               Energy Offset               !
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

    do i=1,4
        E(i) = E(i) - E(1)
    end do

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!               Dipole               !
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

    do i = 1,4
        do j = 1,4
            trap = 0.d0
            do k = -nx,nx-1
                trap = trap + (psi(i,k+1)*(k+1)*dx*psi(j,k+1) + psi(i,k)*k*dx*psi(j,k))*dx/2.d0
            end do
            d(i,j) = -trap
        end do
    end do
    print*, "Dipole Info:"
    Print*, "---------------------------------------------------------------------------------------------------------"
    print*, d(1,1), d(1,2), d(1,3), d(1,4)
    print*, d(2,1), d(2,2), d(2,3), d(2,4)
    print*, d(3,1), d(3,2), d(3,3), d(3,4)
    print*, d(4,1), d(4,2), d(4,3), d(4,4)
    print*, "---------------------------------------------------------------------------------------------------------"

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!               Init Coeff and Freq               !
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

    w = E(2)-E(1)+0.03

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!               Loop Over time               !
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

    open(100,file="dat/q3_1.dat")
    open(101,file="dat/q3_2.dat")
    open(102,file="dat/q3_3.dat")
    open(103,file="dat/q3_4.dat")
    open(104,file="dat/q3_norm.dat")

    c = (0.d0,0.d0)
    c(1,-nt) = 1.d0; c(1,-nt+1) = 1.d0
    do i=1,4
        write(99+i,*) -nt*dt, abs(c(i,-nt))**2
        write(99+i,*) (-nt+1)*dt, abs(c(i,-nt+1))**2
    end do
    write(104,*) -nt*dt, abs(c(1,-nt))**2; write(104,*) (-nt+1)*dt, abs(c(1,-nt+1))**2 

    do i = -nt+1,nt
        t = i * dt
        normcheck = 0.d0
        do j = 1,4
            do k = 1,4
                if(j/=k) then
                    c(j,i+1) = c(j,i+1) - 2.d0 * dt * ci * c(k,i) * d(j,k) * E0 * exp(-t**2/(2*sig**2)) * sin(w*t)
                else
                    c(j,i+1) = c(j,i+1) - 2.d0 * dt * ci * E(k) * c(k,i)
                end if
            end do
            c(j,i+1) = c(j,i+1)+c(j,i-1)
            normcheck = normcheck + abs(c(j,i))**2
            write(99+j,*) t, abs(c(j,i+1))**2
        end do
        write(104,*) t, normcheck
    end do

    close(100)
    close(101)
    close(102)
    close(103)
    close(104)

  !CALL SYSTEM('gnuplot -p dat/q3.plt')
end program
