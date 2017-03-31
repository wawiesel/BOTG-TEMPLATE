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

#Do this at the beginning of a package.
TRIBITS_PACKAGE( BOTG_TEMPLATE )

botgUseCxxStandard( 11 )

SET(SOURCES
    TMPL/Demo.cc
    TMPL/Fortran/c_linkage.cc
)
SET(HEADERS
    TMPL/Demo.hh
    TMPL/Fortran/c_linkage.h
)
TRIBITS_ADD_LIBRARY( BOTG_TEMPLATE
  SOURCES
    ${SOURCES}
  NOINSTALLHEADERS
    ${HEADERS}
)

INCLUDE_DIRECTORIES(
    ${CMAKE_CURRENT_SOURCE_DIR}
)

INSTALL(
  FILES
    ${HEADERS}
  DESTINATION
    include/TMPL
)

#Executable utility
TRIBITS_ADD_EXECUTABLE( utility
  NOEXEPREFIX
  SOURCES
    TMPL/utility.cc
)

TRIBITS_ADD_TEST_DIRECTORIES( TMPL/test )

IF(${PROJECT_NAME}_ENABLE_Fortran)

    # Enable fortran goodies.
    botgEnableFortran(
        C_PREPROCESSOR
        UNLIMITED_LINE_LENGTH
    )

    TRIBITS_ADD_LIBRARY( BOTG_TEMPLATE_Fortran
      SOURCES
        TMPL/Fortran/Demo_M.f90
    )

    # Fortran modules must be on include path.
    INCLUDE_DIRECTORIES(
        ${CMAKE_CURRENT_BINARY_DIR}
    )

    #Link fortran library to C++
    TARGET_LINK_LIBRARIES( BOTG_TEMPLATE_Fortran BOTG_TEMPLATE )

    TRIBITS_ADD_TEST_DIRECTORIES( TMPL/Fortran/test )

ENDIF()

#Do this at the end.
TRIBITS_PACKAGE_POSTPROCESS()
