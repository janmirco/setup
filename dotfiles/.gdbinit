# ==============================================================================
#                 _____ _____  ____                   __ _
#                / ____|  __ \|  _ \                 / _(_)
#               | |  __| |  | | |_) | ___ ___  _ __ | |_ _  __ _
#               | | |_ | |  | |  _ < / __/ _ \| '_ \|  _| |/ _` |
#               | |__| | |__| | |_) | (_| (_) | | | | | | | (_| |
#                \_____|_____/|____/ \___\___/|_| |_|_| |_|\__, |
#                                                           __/ |
#                                                          |___/
#
# ==============================================================================

# set breakpoint at argument (file:line)
define b
    break $arg0
    refresh
end

# start program
define r
    run
    refresh
end

# display value of argument (variable)
define p
    print $arg0
    refresh
end

# set watchpoint for argument (variable)
define w
    watch $arg0
    refresh
end

# continue running program
define c
    continue
    refresh
end

# continue running program up to argument (file:line)
define a
    advance $arg0
    refresh
end

# jump (also backwards) to specific line and continue running program
define j
    jump $arg0
    refresh
end

# next line, stepping OVER function calls
define n
    next
    refresh
end

# next line, stepping INTO function calls
define s
    step
    refresh
end

# run until selected stack frame returns (step out of current function)
define f
    finish
    refresh
end

# kill running program being debugged without closing GDB
define k
    kill
    refresh
end



# ==============================================================================
#   Reverse commands (not supported for multi-threaded targets)
# ==============================================================================

# previous line, stepping OVER function calls
define rn
    reverse-next
    refresh
end

# previous line, stepping INTO function calls
define rs
    reverse-step
    refresh
end

# back to the point where function was called (instead of ending up at the end
# of the current function invocation, you end up at the beginning)
define rf
    reverse-finish
    refresh
end
