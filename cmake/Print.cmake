function(PrintVariable Variable)
    message(STATUS "${Variable} is ${${Variable}}")
endfunction()
