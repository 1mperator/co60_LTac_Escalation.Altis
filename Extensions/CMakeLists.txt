cmake_minimum_required(VERSION 2.8)

project (Escalation)
add_library(foo SHARED foo.cpp)
add_library(bar SHARED bar.cpp)
add_library(timer SHARED timer.cpp)
install(TARGETS timer DESTINATION $ENV{ARMADIR})
