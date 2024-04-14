program q1
    real :: k, m, z0, v0, dt, b
    integer :: Tmin
    k = 1.; m = 1.; z0 = 1.; v0 = 0.; dt = 0.025; Tmin = 10; b = 4.
    call eulerSHO(k, m, z0, v0, dt, Tmin)
    call cromerSHO(k, m, z0, v0, dt, Tmin)
    call cromerANP(k, m, z0, v0, dt, Tmin,b)
    CALL SYSTEM("gnuplot -p dat/q1/q1.plt")
end program q1

subroutine eulerSHO(k, m, z0, v0, dt, Tmin)
    real, intent(in) :: k, m, z0, v0, dt
    integer, intent(in) :: Tmin
    real :: z,zl,v,vl,tn,T,E
    integer :: nSmax
    open(1, file = "dat/q1/q1_esho.dat")
    z = z0; zl=z; v = v0; vl=v; tn = 0.; E = 0.5 * m * v ** 2 + 0.5 * k * z ** 2
    T = 2.*acos(-1.)*sqrt(m/k)
    nSmax = ceiling(Tmin*1.*T/dt)
    write(1,*) z, v, E, tn
    do i = 1,nSmax
        z = zn(vl,zl,dt)
        v = vn(vl,k,zl,dt,m)
        E = 0.5 * m * v ** 2 + 0.5 * k * z ** 2
        zl = z
        vl = v
        tn = i * dt
        write(1,*) z, v, E, tn
    end do
    close(1,status="keep")
end subroutine eulerSHO

subroutine cromerSHO(k, m, z0, v0, dt, Tmin)
    real, intent(in) :: k, m, z0, v0, dt
    integer, intent(in) :: Tmin
    real :: z,v,tn,T,E
    integer :: nSmax
    open(1, file = "dat/q1/q1_csho.dat")
    z = z0; v = v0; tn = 0.; E = 0.5 * m * v ** 2 + 0.5 * k * z ** 2
    T = 2.*acos(-1.)*sqrt(m/k)
    nSmax = ceiling(Tmin*1.*T/dt)
    write(1,*) z, v, E, tn
    do i = 1,nSmax
        z = zn(v,z,dt)
        v = vn(v,k,z,dt,m)
        E = 0.5 * m * v ** 2 + 0.5 * k * z ** 2
        tn = i * dt
        write(1,*) z, v, E, tn
    end do
    close(1,status="keep")
end subroutine cromerSHO

subroutine cromerANP(k, m, z0, v0, dt, Tmin,b)
    real, intent(in) :: k, m, z0, v0, dt, b
    integer, intent(in) :: Tmin
    real :: z,v,tn,T,E,tempt1,tempt2
    integer :: nSmax, temp
    open(1, file = "dat/q1/q1_canp.dat")
    z = z0; v = v0; tn = 0.; E = 0.5 * m * v ** 2 + 0.5 * k * z ** 2; temp = 1
    T = 2.*acos(-1.)*sqrt(m/k)
    nSmax = ceiling(Tmin*1.*T/dt)
    write(1,*) z, v, E, tn
    do i = 1,nSmax
        z = zn(v,z,dt)
        v = vanp(v,k,z,dt,m,b)
        E = 0.5 * m * v ** 2 + 0.5 * k * z ** 2
        tn = i * dt
        write(1,*) z, v, E, tn
        if(z<=-1. .AND. temp == 1) then; tempt1 = tn; temp = 0
        else if(z<=-1. .AND. temp == 0) then; tempt2 = tn; temp = 1
        end if
    end do
    print*, tempt2-tempt1
    close(1,status="keep")
end subroutine cromerANP

function vn(v,k,z,dt,m)
    real, intent(in) :: v,k,z,dt,m
    real vn
    vn = v - k * z * dt / m
end function vn

function zn(v,z,dt)
    real, intent(in) :: v,z,dt
    real zn
    zn = z + v * dt
end function zn

function vanp(v,k,z,dt,m,b)
    real, intent(in) :: v,k,z,dt,m,b
    real vanp
    vanp = v + (-k*z-b*z**3 )*dt/m
end function vanp