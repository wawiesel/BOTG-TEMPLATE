#include "TMPL/Demo.hh"
#include "t123/TestFile.hh"
namespace TMPL
{
namespace test
{

TEST( Demo, Basic )
{
    EXPECT_EQ( 10, cxx_function(5) );
}

}//test
}//TMPL
