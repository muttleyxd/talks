add_remark_slides(cmake_from_zero_to_something ALL
    NAME "cmake_from_zero_to_something"
    TITLE "CMake - from zero to something"
    STYLE remark-style-default
    STYLE_TEMPLATE style.css.in
    MARKDOWN_SLIDES 01-intro.md
                    02-basic-usage-as-user.md
                    03-basic-usage-as-developer.md
                    04-things-to-know.md
                    05-code-structuring.md
                    06-modern-cmake.md
                    07-integration-with-external-tooling.md
                    08-ctest-cpack.md
                    09-cpp-bonus.md
                    10-outro.md
    LANGUAGES remark-language-cmake
    RESOURCES images/02-ccmake.png
              images/02-cmake-gui.png
              images/06-external-project.png
              images/08-cdash.png
              images/08-ctest-targets.png
)
