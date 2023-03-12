
message("${CMAKE_CXX_COMPILER}")

file(
    GLOB CPPFRONTSRC
    "${CMAKE_SOURCE_DIR}/cppfront/include/*"
    "${CMAKE_SOURCE_DIR}/cppfront/source/*"
)

include_directories(SYSTEM "${CMAKE_SOURCE_DIR}/cppfront/include"  "${CMAKE_SOURCE_DIR}/cppfront/source")

ADD_CUSTOM_COMMAND(OUTPUT ${CMAKE_SOURCE_DIR}/build/cppfront
  COMMAND "${CMAKE_CXX_COMPILER}" "${CMAKE_SOURCE_DIR}/cppfront/source/cppfront.cpp" -O2 -std=c++20 -o cppfront
  WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}/build
  DEPENDS ${CPPFRONTSRC}
)

ADD_CUSTOM_TARGET(GenerateCppFrontTranspiler ALL
   DEPENDS ${CMAKE_SOURCE_DIR}/build/cppfront
)
