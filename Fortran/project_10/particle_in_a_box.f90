program main
    integer :: N, statenum = 0, nE = 10000
    real*8, allocatable, dimension(:) :: U, psic, psil, v
    real *8 :: dx = 0.01d0, E = -12.5, dE, derivc, derivl, A, trap
    character(len=10) :: file_id
    character(len=50) :: file_name
    N = int(20/dx)
    allocate(U(-N:N), psic(-N:N), psil(-N:N),v(-N:N))
    psic(-N) = 0.d0; psic(-N+1) = 0.001
    psil(-N) = 0.d0; psil(-N+1) = 0.001
    dE = 12.5/(nE*1.d0)

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!                   init potential                   !
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

    do i = -N,N
        U(i) = 0.d0
        if(abs(i*dx) <= 1.d0) U(i) = -12.5d0
    end do

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!                   init wave func                   !
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

    v(-N) = 0.d0
    v(-N+1) = (psil(-N+1)-psil(-N))/dx

    do j= -N+1,1
        v(j+1) = v(j) - 2.d0*(E-U(j))*psil(j)*dx
        psil(j+1) = psil(j) + V(j+1)*dx
    end do
 
    derivl = (psil(1) - psil(-1))/(2.d0*dx)
 
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!                   Loop Over Energy                   !
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 
    do i = 0,nE !700
        E = E+dE

    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    !                   Prop. Wave Func @ E+i*dE                   !
    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 
        v(-N) = 0
        v(-N+1) = (psic(-N+1)-psic(-N))/dx
 
        do j = -N+1,1
            v(j+1) = v(j) - 2.d0*(E-U(j))*psic(j)*dx
            psic(j+1) = psic(j) + V(j+1)*dx
        end do
 
    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    !                   Check for Parity, Norm, Write to File                   !
    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 
        derivc = (psic(1) - psic(-1))/(2.d0*dx)
 
        if(derivc*derivl < 0.d0) then
            statenum = statenum + 1
            print*, "State: ", statenum, "Parity: ", "Even ", "Energy: ", E
            do j = 1,N
                psic(j) = psic(-j)
            end do
            trap = 0
            do j = -N,N-1
                trap = trap + (psic(j+1)**2+psic(j)**2)*dx/2.d0
            end do
            A = sqrt(1.d0/trap)
            psil = psic
            derivl = derivc
            write(file_id, '(i0)') statenum
            file_name = "dat/q2_" // trim(adjustl(file_id)) // '.dat'
            open(100, file = trim(file_name))
            do j = -N,N
                write(100,*) dx*j, A*psic(j)
            end do
            close(100)
 
        else if(psic(0)*psil(0) < 0.d0) then
            statenum = statenum + 1
            print*, "State: ", statenum, "Parity: ", "Odd  ", "Energy: ",E
            do j = 1,N
                psic(j) = -psic(-j)
            end do
            trap = 0
            do j = -N,N-1
                trap = trap + (psic(j+1)**2+psic(j)**2)*dx/2.d0
            end do
            A = sqrt(1.d0/trap)
            psil = psic
            derivl = derivc
            write(file_id, '(i0)') statenum
            file_name = "dat/q2_" // trim(adjustl(file_id)) // '.dat'
            open(100, file = trim(file_name))
            do j = -N,N
                write(100,*) dx*j, -A*psic(j)
            end do
            close(100)

        end if

        psil = psic
        derivl = derivc
 
    end do

    CALL SYSTEM('gnuplot -p dat/q2.plt')

end program main