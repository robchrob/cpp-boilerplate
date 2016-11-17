file(GLOB_RECURSE ALL_SOURCE_FILES src/*.[ch]pp)

find_program(CLANG_FORMAT "clang-format")
if(CLANG_FORMAT)
    add_custom_target(
        clang-format
        COMMAND /usr/bin/clang-format -i ${ALL_SOURCE_FILES}
        COMMAND /usr/bin/sed -i -f "semicolon-space" ${ALL_SOURCE_FILES}
        #TODO, put regex in command, not external file
    )
endif()

find_program(CLANG_TIDY "clang-tidy")
if(CLANG_TIDY)
    add_custom_target(
        clang-tidy
        COMMAND /usr/bin/clang-tidy -p=build/ ${ALL_SOURCE_FILES} 2> /dev/null
    )

    add_custom_target(
        clang-tidy-fix
        COMMAND /usr/bin/clang-tidy -p=build/ -fix ${ALL_SOURCE_FILES} 2> /dev/null
    )
endif()
