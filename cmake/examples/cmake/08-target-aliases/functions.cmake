function(download_gtest)
	include(ExternalProject)
	set(GTEST_VERSION 1.8.0)
	set(GTEST_SHA256HASH f3ed3b58511efd272eb074a3a6d6fb79d7c2e6a0e374323d1e6bcbcc1ef141bf)
	
	set(GTEST_URL https://github.com/google/googletest/archive/release-${GTEST_VERSION}.zip)
	
	ExternalProject_Add(
	    gtest
	    URL ${GTEST_URL}
	    URL_HASH SHA256=${GTEST_SHA256HASH}
	    DOWNLOAD_NAME googletest-${GTEST_VERSION}.zip
	    DOWNLOAD_DIR ${CMAKE_SOURCE_DIR}/external/gtest
	    PREFIX ${CMAKE_CURRENT_BINARY_DIR}/external/gtest
	    LOG_INSTALL 0
	    INSTALL_COMMAND ""
	    CMAKE_ARGS -DCMAKE_C_COMPILER=${CMAKE_C_COMPILER} -DCMAKE_CXX_COMPILER=${CMAKE_CXX_COMPILER} -DCMAKE_CXX_FLAGS="-Wno-deprecated-copy"
	)
	
	# CMake is beautiful - https://gitlab.kitware.com/cmake/cmake/issues/15052
	file(MAKE_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/external/gtest/src/gtest/googletest/include")
	
	add_library(libgtest STATIC IMPORTED GLOBAL)
	target_include_directories(libgtest SYSTEM INTERFACE "${CMAKE_CURRENT_BINARY_DIR}/external/gtest/src/gtest/googletest/include")
	target_link_libraries(libgtest INTERFACE pthread)
	set_target_properties(libgtest PROPERTIES
	                      IMPORTED_LOCATION "${CMAKE_CURRENT_BINARY_DIR}/external/gtest/src/gtest-build/googlemock/gtest/libgtest.a")
	
	add_library(libgtest_main STATIC IMPORTED GLOBAL)
	target_include_directories(libgtest_main SYSTEM INTERFACE "${CMAKE_CURRENT_BINARY_DIR}/external/gtest/src/gtest/googletest/include")
	target_link_libraries(libgtest INTERFACE pthread)
	set_target_properties(libgtest_main PROPERTIES
	                      IMPORTED_LOCATION "${CMAKE_CURRENT_BINARY_DIR}/external/gtest/src/gtest-build/googlemock/gtest/libgtest_main.a")
	
	add_dependencies(libgtest gtest)
	add_dependencies(libgtest_main gtest)
endfunction()
