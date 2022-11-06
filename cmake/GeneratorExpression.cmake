# debug or release mode
add_custom_target(genexdebug COMMAND ${CMAKE_COMMAND} -E echo "$<IF:$<CONFIG:Debug>,DEBUG_MODE,RELEASE_MODE>")

file(GENERATE OUTPUT generator_expressions_debug.txt CONTENT
    "1. $<IF:$<CONFIG:Debug>,DEBUG_MODE,RELEASE_MODE>
    "
)