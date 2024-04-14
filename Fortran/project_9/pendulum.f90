program q3
    real :: l, m, O0(5), w0, dt
    l = 1.2; m = 2.; w0 = 0; dt = 0.002; O0 = (/0.1,0.2,0.3,0.4,0.5/)
    do i=1,5
        call cromerPen(l,O0(i),w0,dt,i)
        call cromerPenapprox(l,O0(i),w0,dt,i)
        print*, "Calculated period:", 2*acos(-1.)*sqrt(l/9.81)*(1+O0(i)**2/16)
    end do
    print*, "Calculated small angle approx period:", 2*acos(-1.)*sqrt(l/9.81)
    CALL SYSTEM("gnuplot -p dat/q3/q3.plt")
end program q3

subroutine cromerPen(l, O0, w0, dt,iter)
    real, intent(in) :: l, O0, w0, dt
    integer, intent(in) :: iter
    real :: O,w,tn,tempt1, tempt2
    integer temp
    character(len=10) :: file_id
    character(len=50) :: file_name
    write(file_id, '(i0)') iter
    file_name = 'dat/q3/q3_PEN_' // trim(adjustl(file_id)) // '.dat'
    open(1, file = trim(file_name))
    O = O0; w = w0; tn = 0.;temp = 1
    write(1,*) O, w, tn
    do i = 1,10000
        O = On(O,w,dt)
        w = wn(w,l,O,dt)
        tn = i * dt
        write(1,*) O, w, tn
        if(O<=0 .AND. temp == 1) then; tempt1 = tn; temp = 0
        else if(O>=0 .AND. temp == 0) then; tempt2 = tn; temp = 1
        end if
    end do
    print*, "experimental period:", 2.*(tempt2-tempt1)
    close(1,status="keep")
end subroutine cromerPen

subroutine cromerPenapprox(l, O0, w0, dt,iter)
    real, intent(in) :: l, O0, w0, dt
    integer, intent(in) :: iter
    real :: O,w,tn, tempt1, tempt2
    integer :: temp
    character(len=10) :: file_id
    character(len=50) :: file_name
    write(file_id, '(i0)') iter
    file_name = 'dat/q3/q3_PENapprox_' // trim(adjustl(file_id)) // '.dat'
    open(1, file = trim(file_name))
    O = O0; w = w0; tn = 0.; temp = 1
    write(1,*) O, w, tn
    do i = 1,10000
        O = On(O,w,dt)
        w = wnapprox(w,l,O,dt)
        tn = i * dt
        write(1,*) O, w, tn
        if(O<=0 .AND. temp == 1) then; tempt1 = tn; temp = 0
        else if(O>=0 .AND. temp == 0) then; tempt2 = tn; temp = 1
        end if
    end do
    print*, "Small angle approx experimental period:", 2.*(tempt2-tempt1)
    close(1,status="keep")
end subroutine cromerPenapprox

function wn(w,l,O,dt)
    real, intent(in) :: w,l,O,dt
    real wn, g; g = 9.81
    wn = w - g/l * sin(O) * dt 
end function wn

function On(O,w,dt)
    real, intent(in) :: O,w,dt
    real On
    On = O + w * dt
end function On

function wnapprox(w,l,O,dt)
    real, intent(in) :: w,l,O,dt
    real wnapprox, g; g = 9.81
    wnapprox = w - g/l * O * dt 
end function wnapprox