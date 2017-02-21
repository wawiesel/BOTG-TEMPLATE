#include "c_linkage.h"
#include "TMPL/Demo.hh"
#include <iostream>

int TMPL_c_function( int j )
{
    std::cout << "TMPL_C\n";
    return TMPL::cxx_function( j );
}
