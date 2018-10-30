program kol
  use defs; implicit none
  integer(i4b)::k,n,inf
  real(qp)::u,Ku,Kuc
  real(dp)::Kud,ud,Kucd
  integer(i4b), parameter::m=-1
  write(6,*)'inf = ?'; read(5,*) inf
  open(7,file='kolout')
  do n = 1, 1000
     u = 0.004_qp*n
     Ku = 0.0_qp
     do k = 1, inf
        Ku = Ku + m**k*exp(-2.0_qp*(k*u)**2)
     end do
     Ku = 2.0_qp*Ku + 1.0_qp
     Kud = Ku; ud = u
     write(7,*)ud, Kud 
  end do
  write(6,*) 'What is u?'; read(5,*) u
  Ku = 0.0_qp
  do k = 1, inf
     Ku = Ku + m**k*exp(-2.0_qp*(k*u)**2)
  end do
  Ku = 2.0_qp*Ku + 1.0_qp
  Kuc = 1.0_qp - Ku; Kud = Ku; Kucd = Kuc
  write(6,*)'K(u) =',Ku,Kud
  write(6,*)'1 - K(u) =',Kuc,Kucd
end program kol
