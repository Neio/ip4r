cmake_minimum_required (VERSION 2.6)
project (ip4r)
set(POSTGRESQL_DIR "${CMAKE_INSTALL_PREFIX}"  CACHE PATH "PostgreSQL binary directory")
set(POSTGRESQL_VERSION "unknown"  CACHE STRING "PostgreSQL version")

include_directories(
  "${POSTGRESQL_DIR}/include/server/port/win32_msvc"
  "${POSTGRESQL_DIR}/include/server/port/win32"
  "${POSTGRESQL_DIR}/include/server"
  "${POSTGRESQL_DIR}/include"
  "vendor/v8/include"
  "src") 	
  link_directories(
  "${POSTGRESQL_DIR}/lib")
add_library(ip4r SHARED src/ip4r.c  src/ip4r_module.c  src/ip6r.c  src/ipaddr.c  src/iprange.c  src/raw_io.c)
target_link_libraries("ip4r"  "postgres.lib")