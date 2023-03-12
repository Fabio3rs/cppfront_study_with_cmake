project(Cpp2Test CXX)
cmake_minimum_required(VERSION 3.16)

include(cmake/cppfront.cmake)

add_compile_options(-std=c++20)

file(
    GLOB CPP2SOURCES
    "${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp2"
)

foreach(file ${CPP2SOURCES})
    string(REGEX REPLACE "[.]cpp2$" ".cpp" output_file "${file}")
    list(APPEND OUTPUT_SOURCES "${output_file}")
    ADD_CUSTOM_COMMAND(OUTPUT "${output_file}"
        COMMAND ${CMAKE_SOURCE_DIR}/build/cppfront "${file}"
        DEPENDS "${file}"
    )
endforeach(file ${CPP2SOURCES})

add_custom_target(TranspileToCpp ALL
    DEPENDS ${CPP2SOURCES}
)

add_executable(helloworld ${OUTPUT_SOURCES})
add_dependencies(helloworld TranspileToCpp)
