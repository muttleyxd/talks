#!/usr/bin/env bash
check_format()
{
    for file in `find "$1" -name "*.cpp" -or -name "*.c" -or -name "*.hpp" -or -name "*.h"`
    do
        clang-format "$file" | diff -u "$file" -
        if [ $? -ne 0 ]; then
            export EXIT_STATUS=1
        fi
    done
}

format()
{
    for file in `find "$1" -name "*.cpp" -or -name "*.c" -or -name "*.hpp" -or -name "*.h"`
    do
        clang-format -i $file
    done
}

if [ -z "$2" ] || [ ! -e "$2" ]; then
    usage
fi

EXIT_STATUS=0

if [ "$1" == "check" ]; then
    check_format $2
fi
if [ "$1" == "format" ]; then
    format $2
fi

exit $EXIT_STATUS
