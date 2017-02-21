module TMPL_Demo_M

use ISO_C_BINDING

implicit none

private

interface
    function TMPL_c_function(j) result(i) BIND(C,name="TMPL_c_function")
    use ISO_C_BINDING
    integer(C_INT), value :: j
    integer(C_INT) :: i
    end function
end interface

public :: TMPL_bound_function

contains

function TMPL_bound_function(j) result(i)
    integer, intent(in) :: j
    integer :: i
    write(*,*)"here with j=",j
    i=TMPL_c_function(int(j,C_INT))
    write(*,*)'after'
end function

end module
