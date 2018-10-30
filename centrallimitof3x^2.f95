program newex2
  implicit none ! avoids typos
  character(len=1)::ch_i1
  integer::j,k,n,m,npoints
  real(8)::y ! double precision
  real(8),allocatable,dimension(:)::r,u,plot,rplot
  real(8),parameter::onethird = 1.d0/3.d0, zero = 0.0d0
  write(6,*)'What are j and npoints?'; read(5,*) j, npoints
  allocate(u(2**j),r(2**j),plot(npoints),rplot(npoints)); plot = zero
  call init_random_seed() ! set new seed, see below
  do k = 1, 10000000  ! Make the N = 2**j plot
     call random_number(u)
     r = u**onethird
     y = sum(r)/2**j
     n = npoints*y + 1 
     plot(n) = plot(n) + 1
  end do
  rplot = npoints*real(plot)/sum(plot)
  write(ch_i1,"(i1)") j ! turns integer j into character ch_i1
  open(7,file='plotex2'//ch_i1//'.dat') ! opens and names files
  do m = 1, npoints
     write(7,*) 0.01d0*(m-0.5), rplot(m)
  end do 
end program newex2
subroutine init_random_seed()
  implicit none
  integer i, n, clock
  integer, dimension(:), allocatable :: seed
  call random_seed(size = n) ! find size of seed
  allocate(seed(n))
  call system_clock(count=clock) ! get time of processor clock
  seed = clock + 37 * (/ (i-1, i=1, n) /) ! make seed
  call random_seed(put=seed) ! set seed
  deallocate(seed)
end subroutine init_random_seed

