module tstDemo_M
#include "t123/TestFile.f90i"
use TMPL_Demo_M

implicit none

contains

TEST( Demo, Basic )

    EXPECT_EQ( 0, TMPL_bound_function(0) )
    EXPECT_EQ( 2, TMPL_bound_function(1) )
    EXPECT_EQ( 4, TMPL_bound_function(2) )
    EXPECT_EQ( 6, TMPL_bound_function(3) )

ENDTEST

end module

program main
use tstDemo_M
!
RUN_ALL_TESTS()
!
end program
