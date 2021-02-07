cmake_minimum_required(VERSION 3.14)
project(lightdm-qtquick-greeter LANGUAGES CXX)
add_subdirectory(src)

INSTALL(TARGETS lightdm-qtquick-greeter RUNTIME DESTINATION usr/bin)
INSTALL(FILES lightdm-qml-greeter.desktop DESTINATION usr/share/xgreeters/lightdm-qml-greeter.desktop PERMISSIONS OWNER_READ GROUP_READ WORLD_READ)