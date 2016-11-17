set(CATCH_DIR ${Playground_SOURCE_DIR}/lib/catch/include)
file(GLOB TEST_SRC ${Playground_SOURCE_DIR}/test/*.[ch]pp)

add_library(Catch INTERFACE)

target_include_directories(Catch INTERFACE ${CATCH_DIR})
add_executable(app_test ${TEST_SRC}) #TODO, get all src without main
target_link_libraries(app_test Catch)
enable_testing()
add_test(NAME app_test COMMAND app_test)
add_custom_command(
     TARGET app_test
     POST_BUILD
     COMMAND app_test
)
