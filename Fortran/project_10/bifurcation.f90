program main
    real*8 :: x, a, da
    Print*, "Running Q1 Part A"
    open(100, file="dat/q1.dat")
    x = 0.5
    a = 1.d0
    da = 0.01
    do i = 1,300
        a = a + da
        do j = 1,1000
            x = a * x * (1.d0 - x)
            if(j>950) write(100,*) a, x
        end do
    end do
    Print*, "Q1 Part A Done"
    CALL SYSTEM('gnuplot -p dat/q1.plt')
end program main