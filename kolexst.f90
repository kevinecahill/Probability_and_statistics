program kolexst
  use defs; implicit none
  integer(i4b)::j,k,n,nr
  real(qp)::u,Ku
  real(dp)::Kud,ud,s,xmin,Dpl,Dm,P,D,rnd,z,sig2,sig32
  real(dp),dimension(2)::rdn,v
  real(dp),dimension(4)::array,barray
  real(dp),dimension(:),allocatable::x,xo,Dplus,Dminus,uks,ukso,y1,y2
  integer(i4b), parameter::m=-1, inf = 10000
  real(dp),parameter::nu=3.0d0, alpha = 1.d0/sqrt(3.0d0)
  call random_seed()
  write(6,*) 'How many points?'; read(5,*) n
  write(6,*) 'How many runs?'; read(5,*) nr
  allocate(x(n),xo(n),Dplus(n),Dminus(n),y1(n),y2(n),uks(nr),ukso(nr))
  ! Generate n Student's dist. x's with 0 mean, a = 1, nu = 3
  ! using eq. 32 (Knuth 128) and Marsaglia's method (Knuth 130)
  ! Then divide x by sqrt(3) to make sig = 1.
  ! so we first use Kunth's algorithm P to make normal deviates
  sig2 = 0.0d0
  do j = 1, nr
     do k = 1, n
2       call random_number(rdn)
        v = 2*rdn - 1
        s = dot_product(v,v) 
        if ( s >= 1.0d0 ) then
           go to 2
        else
           y1(k) = v(1)*sqrt(-2*log(s)/s) ! throw away other one
        end if
        ! Now we make Student's distribution
        call random_number(rnd)
        y2(k) = -2/(nu-2.0d0)*log(rnd)
        z = y1(k)**2/(nu-2.0d0)
        if (exp(-y2(k)-z) < 1.0d0 - z) then
           x(k) = y1(k)/sqrt((1.d0-2/nu)*(1.0d0-z))
        else
           go to 2
        end if
        x(k) = x(k)*alpha; sig2 = sig2 + x(k)**2
     end do
     ! Order the Student points 
     do k = 1, n
        xo(k) = x(minloc(x,1))
        x(minloc(x,1)) = 1.0d20 + k
     end do
     ! Compute Dpl, Dm, and D, and then u:
     do k = 1, n
        P = 0.5d0*(erf(xo(k)/sqrt(2.0d0)) + 1.0d0)
        Dplus(k) = k/real(n,dp) - P
        Dminus(k) = P - (k-1)/real(n,dp)
     end do
     Dpl = maxval(Dplus); Dm = maxval(Dminus)
     D = max(Dpl,Dm); uks(j) = sqrt(real(n,dp))*D
     if (nr == 1) then
        write(6,'(a,i8,a,e13.6,a,i8,a,i8,a,e13.6)') 'D(',n,') =', &
             D,' sqrt(',n,')D(',n,') =',sqrt(real(n,dp))*D
        write(6,'(a,e13.6)') 'sigma1^2 =',sig2/real(n,dp)
     end if
  end do
  open(7,file='kolexst')
  ! Order the uks as ukso.  These are the sqrt(N)*D_N's.
  do j = 1, nr
     ukso(j) = uks(minloc(uks,1))
     uks(minloc(uks,1)) = 1.0d20 + j
  end do
  ! Make Pr(-infty,u)
  do j = 1, nr-1
     write(7,*) ukso(j), j/real(nr,dp)
     write(7,*) ukso(j+1), j/real(nr,dp)
  end do
  close(7)
end program kolexst
