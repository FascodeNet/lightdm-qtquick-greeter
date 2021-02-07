cmake_minimum_required(VERSION 3.14)
project(lightdm-qtquick-greeter LANGUAGES CXX)
add_subdirectory(src)

INSTALL(TARGETS lightdm-qtquick-greeter RUNTIME DESTINATION /usr/bin)
INSTALL(FILES misc/lightdm-qtquick-greeter.desktop DESTINATION /usr/share/xgreeters/lightdm-qtquick-greeter.desktop PERMISSIONS OWNER_READ GROUP_READ WORLD_READ)
INSTALL(FILES misc/lightdm-qtquick-greeter.json DESTINATION /etc/lightdm/lightdm-qtquick-greeter.json PERMISSIONS OWNER_READ GROUP_READ WORLD_READ)
