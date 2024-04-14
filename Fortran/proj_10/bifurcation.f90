program main
    integer :: N=20000, na=10000
    real*8 :: x, sum, a, da
    da = 1.d0/na; x = 0.7
    open(100,file='dat/q1_c.dat')
    do j = 0,na
        a = 3.d0 + j*da
        sum = 0.d0
        do i = 1,N-1
            if(i>=20) sum = sum + log(abs(a-2.d0*x*a))
            x = a*x*(1.d0-x)
        end do
        write(100,*) a, 1.d0/(N-20) * sum
    end do
    CALL SYSTEM('gnuplot -p dat/q1_c.plt')
end program main
