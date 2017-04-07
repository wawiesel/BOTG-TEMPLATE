##
##
##src/CMakeLists.txt
##------------------------------------------------------------------------------
##This is a standard **package** CMakeLists.txt file describing
##the code. Below I build an executable, a library, install headers,
###and declare a test directory.
##
##.. code-block:: cmake
##

botgPackage( BOTG_TEMPLATE )

botgUseCxxStandard( 11 )

botgLibrary( BOTG_TEMPLATE
    SOURCES
        TMPL/Demo.cc
    HEADERS
        TMPL/Demo.hh
)

TRIBITS_ADD_EXECUTABLE( utility
  NOEXEPREFIX
  SOURCES
    TMPL/utility.cc
)

botgEnableFortran(
    C_PREPROCESSOR
    UNLIMITED_LINE_LENGTH
)

botgLibrary( BOTG_TEMPLATE_Fortran
    LANGUAGE Fortran
    SOURCES
        TMPL/Fortran/Demo_M.f90
        TMPL/Fortran/c_linkage.cc
    HEADERS
        TMPL/Demo.hh
        TMPL/Fortran/c_linkage.h
    LINK_TO
        BOTG_TEMPLATE
)

botgTestDir( 
    TMPL/test 
    TMPL/Fortran/test
)

botgEnd()

