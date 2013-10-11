cmake_minimum_required(VERSION 2.8)

project (Escalation)
add_library(foo SHARED foo.cpp)
add_library(bar SHARED bar.cpp)
add_library(timer SHARED timer.cpp)
install(TARGETS timer DESTINATION $ENV{ARMADIR})

add_library(escalationdb SHARED escalationdb.cpp)

### sqlite3 stuff - ensure sqlite sources are available before a build system is generated

set(SQLITELIBURL "https://www.sqlite.org/2013/sqlite-dll-win32-x86-3080002.zip")
set(SQLITEDOWNLOAD "${PROJECT_SOURCE_DIR}/tmp/sqlite.zip")
set(SQLITEDEF "${PROJECT_BINARY_DIR}/sqlite3.def")
set(SQLITELIB "${PROJECT_BINARY_DIR}/sqlite3.lib")
set(SQLITESHARED "${PROJECT_BINARY_DIR}/sqlite3.dll")
set(SQLITELIBHASH "73849410ab5593d3659c049f76907d7316c7e607")
set(SQLITELIB_NEEDS_DOWNLOAD true)

if(EXISTS ${SQLITEDOWNLOAD})
    file(SHA1 ${SQLITEDOWNLOAD} SQLITELIBHASH_FOUND)
    if("${SQLITELIBHASH}" EQUAL "${SQLITELIBHASH_FOUND}")
        set(SQLITELIB_NEEDS_DOWNLOAD false)
    endif()
endif()
if(${SQLITELIB_NEEDS_DOWNLOAD})
    file(DOWNLOAD ${SQLITELIBURL} ${SQLITEDOWNLOAD} SHOW_PROGRESS)
    execute_process(COMMAND "${CMAKE_COMMAND}" "-E" "tar" "xvf" "${SQLITEDOWNLOAD}")
    execute_process(COMMAND "lib" "/def:${SQLITEDEF}" "/OUT:${SQLITELIB}")
endif()

target_link_libraries(escalationdb ${SQLITELIB})

install(TARGETS escalationdb DESTINATION $ENV{ARMADIR})
