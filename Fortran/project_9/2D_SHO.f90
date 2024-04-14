program q2
    real :: kx, ky, m, x0, y0, vx0, vy0, dt
    kx = 1.; ky = 1.; m = 1.; x0 = 1.; y0 = 1.; vx0 = 1.; vy0 = 2.; dt = 0.0025;
    call cromerHO(kx, ky, m, x0, y0, vx0, vy0, dt, 1)
    kx = 1.; ky = 4.; 
    call cromerHO(kx, ky, m, x0, y0, vx0, vy0, dt, 2)
    kx = 1.; ky = 2.;
    call cromerHO(kx, ky, m, x0, y0, vx0, vy0, dt, 3)
    CALL SYSTEM("gnuplot -p dat/q2/q2.plt")
end program q2

subroutine cromerHO(kx, ky, m, x0, y0, vx0, vy0, dt, iter)
    real, intent(in) :: kx, ky, m, x0, y0, vx0, vy0, dt
    integer, intent(in) :: iter
    real :: x,y,vx,vy,tn
    character(len=10) :: file_id
    character(len=50) :: file_name
    write(file_id, '(i0)') iter
    file_name = 'dat/q2/q2_cHO_' // trim(adjustl(file_id)) // '.dat'
    open(1, file = trim(file_name))
   !open(1, file = "dat/q2/q2_cHO.dat")
    x = x0; y = y0; vx = vx0; vy = vy0; tn = 0.
    write(1,*) x, y, tn
    do i = 1,100000
        vx = vn(vx,kx,x,dt,m)
        x = zn(vx,x,dt)
        vy = vn(vy,ky,y,dt,m)
        y = zn(vy,y,dt)
        tn = i * dt
        write(1,*) x, y, tn
    end do
    close(1,status="keep")
end subroutine cromerHO

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