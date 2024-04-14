program q2
    real Nmax,dt(4)
    Nmax = 100.; dt = (/0.1,0.5,1.2,2.2/)
    do i = 1,4
        call decay(Nmax,dt,i)
    end do
    CALL SYSTEM("gnuplot -p dat/q2/q2.plt")
end program q2

subroutine decay(Nmax,dt,iter)
    real, intent(in) :: Nmax,dt(4)
    integer, intent(in) :: iter
    real Nc, tstep, tau, tc
    character(len=10) :: file_id
    character(len=50) :: file_name
    write(file_id, '(i0)') iter
    file_name = 'dat/q2/decay_' // trim(adjustl(file_id)) // '.dat'
    open(1, file = trim(file_name))
    Nc = Nmax; tstep = dt(iter); tau = 1.; tc = 0.
    write(1,*) tc, Nc
    do i=1,100
        Nc = Nc*(1.-tstep/tau); tc = tc + tstep
        write(1,*) tc, Nc
    end do
end subroutine decay