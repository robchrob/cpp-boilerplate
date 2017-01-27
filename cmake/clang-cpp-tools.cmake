file(GLOB_RECURSE SOURCE_FILES src/*.[ch]pp)

find_program(CLANG_FORMAT "clang-format")
if(CLANG_FORMAT)
    add_custom_target(
        clang-format
        COMMAND /usr/bin/clang-format -i ${SOURCE_FILES}
        COMMAND /usr/bin/sed -i -f "${PROJECT_SOURCE_DIR}/cmake/semicolon-space" ${SOURCE_FILES}
        #TODO, put regex in command, not external file
        #TODO, LINEBREAK
    )
endif()

find_program(CLANG_TIDY "clang-tidy")
if(CLANG_TIDY)
    add_custom_target(
        clang-tidy
        COMMAND /usr/bin/clang-tidy -p=build/ ${SOURCE_FILES} 2> /dev/null
    )

    add_custom_target(
        clang-tidy-fix
        COMMAND /usr/bin/clang-tidy -p=build/ -fix ${SOURCE_FILES} 2> /dev/null
    )
endif()
