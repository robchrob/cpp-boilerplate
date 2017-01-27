set(CATCH_DIR ${PROJECT_SOURCE_DIR}/lib/catch/include)
file(GLOB TEST_SRC ${PROJECT_SOURCE_DIR}/test/*.[ch]pp)

add_library(Catch INTERFACE)

target_include_directories(Catch INTERFACE ${CATCH_DIR})
add_executable(${APP_NAME}_test ${TEST_SRC}) #TODO, get all src without main
target_link_libraries(${APP_NAME}_test Catch)
enable_testing()
add_test(NAME ${APP_NAME}_test COMMAND ${APP_NAME}_test)
add_custom_command(
     TARGET ${APP_NAME}_test
     POST_BUILD
     COMMAND ${APP_NAME}_test
)
