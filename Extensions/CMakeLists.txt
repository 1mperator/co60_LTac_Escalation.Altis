cmake_minimum_required(VERSION 2.8)

project (Escalation)
add_library(foo SHARED foo.cpp)
add_library(bar SHARED bar.cpp)
add_library(timer SHARED timer.cpp)
install(TARGETS timer DESTINATION $ENV{ARMADIR})

add_library(escalationdb SHARED escalationdb.cpp)

### sqlite3 stuff - ensure sqlite sources are available before a build system is generated
set(SQLITELIBURL "https://www.sqlite.org/2013/sqlite-amalgamation-3080002.zip")
set(SQLITELIBHASH "99055b894259dc85cfb2da92971904f74ec3aa3e")
set(SQLITESRC "${PROJECT_BINARY_DIR}/sqlite-amalgamation-3080002")
set(SQLITEDOWNLOAD "${PROJECT_SOURCE_DIR}/externals/sqlite.zip")

# Ensures the downloaded archive exists and matches the expected hash
set(SQLITELIB_NEEDS_DOWNLOAD true)
if(EXISTS ${SQLITEDOWNLOAD})
    file(SHA1 ${SQLITEDOWNLOAD} SQLITELIBHASH_FOUND)
    if("${SQLITELIBHASH}" EQUAL "${SQLITELIBHASH_FOUND}")
        set(SQLITELIB_NEEDS_DOWNLOAD false)
    endif()
endif()
if(${SQLITELIB_NEEDS_DOWNLOAD})
    message("sqlite3 sources missing or invalid, I shall download them!")
    file(DOWNLOAD ${SQLITELIBURL} ${SQLITEDOWNLOAD}
        SHOW_PROGRESS
        EXPECTED_HASH SHA1=${SQLITELIBHASH})
endif()

add_custom_command(OUTPUT ${SQLITESRC}/sqlite3.c
    COMMAND ${CMAKE_COMMAND} -E tar xfv ${SQLITEDOWNLOAD}
    DEPENDS ${sQLITEDOWNLOAD}
    )
target_include_directories(escalationdb PRIVATE ${SQLITESRC})
add_library(SQLITELIB ${SQLITESRC}/sqlite3.c)
target_link_libraries(escalationdb SQLITELIB)
install(TARGETS escalationdb DESTINATION $ENV{ARMADIR})
