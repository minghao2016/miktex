## CMakeLists.txt                                       -*- CMake -*-
##
## Copyright (C) 2009-2021 Christian Schenk
## 
## This file is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published
## by the Free Software Foundation; either version 2, or (at your
## option) any later version.
## 
## This file is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
## General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this file; if not, write to the Free Software
## Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1307,
## USA.

use_static_crt()

add_library(${app_lib_name} STATIC ${app_sources})

set_property(TARGET ${app_lib_name} PROPERTY FOLDER ${MIKTEX_CURRENT_FOLDER})

add_dependencies(${app_lib_name} gen-${MIKTEX_COMP_ID}-sources)

set_source_files_properties(
  ${generated_${MIKTEX_COMP_ID}_sources}
  PROPERTIES
    GENERATED TRUE
)

target_compile_definitions(${app_lib_name}
  PUBLIC
    -DMIKTEX_APP_STATIC
)

target_include_directories(${app_lib_name}
  PUBLIC
    ${public_include_directories}
)

if(USE_SYSTEM_FMT)
  target_link_libraries(${app_lib_name} PUBLIC MiKTeX::Imported::FMT)
else()
  target_link_libraries(${app_lib_name} PUBLIC ${fmt_lib_name})
endif()

if(USE_SYSTEM_LOG4CXX)
  target_link_libraries(${app_lib_name} PUBLIC MiKTeX::Imported::LOG4CXX)
else()
  target_link_libraries(${app_lib_name} PUBLIC ${log4cxx_lib_name})
endif()

target_link_libraries(${app_lib_name}
  PUBLIC
    ${core_lib_name}
    ${loc_lib_name}
    ${mpm_lib_name}
    ${setup_lib_name}
)

if(INSTALL_STATIC_LIBRARIES)
  install(TARGETS ${app_lib_name}
    RUNTIME DESTINATION "${MIKTEX_BINARY_DESTINATION_DIR}"
    LIBRARY DESTINATION "${MIKTEX_LIBRARY_DESTINATION_DIR}"
    ARCHIVE DESTINATION "${MIKTEX_LIBRARY_DESTINATION_DIR}"
  )
endif()

source_group(Public FILES ${public_headers})
