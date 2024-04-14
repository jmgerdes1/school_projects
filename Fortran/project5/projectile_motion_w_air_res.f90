program q3
    real k(6)
    k = (/0.005,0.01,0.02,0.04,0.06,0.08/)
    do i=1,6
        call range(k(i),i)
    end do
    CALL SYSTEM("gnuplot -p dat/q3/q3.plt")
end program q3

subroutine range(k,iter)
    real, intent(in) :: k
    integer, intent(in) :: iter
    real v0,vy,vx,theta,y,x,Fx,Fy,dt,t,xl,yl
    character(len=10) :: file_id
    character(len=50) :: file_name
    write(file_id, '(i0)') iter
    file_name = 'dat/q3/q3_' // trim(adjustl(file_id)) // '.dat'
    open(1, file = trim(file_name))
    open(9,file="dat/q3/q3_kr.dat")
    v0 = 600.; theta = 60*acos(-1.)/180; vx = v0*cos(theta); vy = v0*sin(theta); y=0.; x=0; dt=0.01; t=0.
    write(1,*) x,y
    Fx = -k*vx; Fy = -k*vy-9.81
    vx = vx + Fx*dt; vy = vy + Fy*dt
    x = x + vx*dt; y = y + vy*dt
    t = t + dt
    write(1,*) x,y
    do while(y>0)
        Fx = -k*vx; Fy = -k*vy-9.81
        vx = vx + Fx*dt; vy = vy + Fy*dt
        xl=x; x = x + vx*dt; yl=y; y = y + vy*dt
        t = t + dt
        if(y>0) write(1,*) x,y
    end do
    x = (-yl)*(x-xl)/(y-yl)+xl
    y = 0.
    write(1,*) x,y
    write(9,*) k,x
end subroutine range