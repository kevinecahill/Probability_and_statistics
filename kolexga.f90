program kolexga
  use defs; implicit none
  integer(i4b)::j,k,n,nr
  real(qp)::u,Ku
  real(dp)::Kud,ud,s,xmin,Dpl,Dm,P,D
  real(dp),dimension(2)::rdn,v
  real(dp),dimension(4)::array,barray
  real(dp),dimension(:),allocatable::x,xo,Dplus,Dminus,uks,ukso
  integer(i4b), parameter::m=-1, inf = 10000
  call random_seed()
  write(6,*) 'How many points?'; read(5,*) n
  write(6,*) 'How many runs?'; read(5,*) nr
  allocate(x(n),xo(n),Dplus(n),Dminus(n),uks(nr),ukso(nr))
  ! Generate n normally dist. x's with 0 mean and sig = 1  
  ! using algorithm P (Knuth 117)
  do j = 1, nr
     do k = 1, n/2
1       call random_number(rdn)
        v = 2*rdn - 1
        s = dot_product(v,v) 
        if ( s >= 1.0d0 ) then
           go to 1
        else
           x(k) = v(1)*sqrt(-2*log(s)/s)
           x(n/2+k) = v(2)*sqrt(-2*log(s)/s)
        end if
     end do
     do k = 1, n
        xo(k) = x(minloc(x,1))
        x(minloc(x,1)) = 1.0d20 + k
     end do
     ! Compute Dpl and Dm
     do k = 1, n
        P = 0.5d0*(erf(xo(k)/sqrt(2.0d0)) + 1.0d0)
        Dplus(k) = k/real(n,dp) - P
        Dminus(k) = P - (k-1)/real(n,dp)
     end do
     Dpl = maxval(Dplus); Dm = maxval(Dminus)
     D = max(Dpl,Dm); uks(j) = sqrt(real(n,dp))*D
     if (nr == 1) then
        write(6,*) 'D(',n,') =', D, &
             ' sqrt(',n,')D(',n,') =',sqrt(real(n,dp))*D
     end if
  end do
  open(7,file='kolexga')
  ! Order uks as ukso.  These are the sqrt(N)*D_N's.
  do j = 1, nr
     ukso(j) = uks(minloc(uks,1))
     uks(minloc(uks,1)) = 1.0d20 + j
  end do
  ! Make Pr(-infty,u)
  do j = 1, nr-1
     write(7,*) ukso(j), j/real(nr,dp)
     write(7,*) ukso(j+1), j/real(nr,dp)
  end do
end program kolexga
