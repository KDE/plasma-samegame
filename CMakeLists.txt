cmake_minimum_required(VERSION 3.8)

project(samegame)

# QT_MAJOR_VERSION is defined automatically by QtVersionOption (since ECM 5.82)
# which is included by KDEInstallDirs;
# This variables are updated below if Qt6 is found by ECM
set(QT_MIN_VERSION "5.14.0")
set(KF5_MIN_VERSION "5.70.0")
set(KF_MAJOR_VERSION "5")

include(FeatureSummary)

find_package(ECM ${KF_MIN_VERSION} NO_MODULE)
set_package_properties(ECM PROPERTIES TYPE REQUIRED DESCRIPTION "Extra CMake Modules." URL "https://projects.kde.org/projects/kdesupport/extra-cmake-modules")

# where to look first for cmake modules, before ${CMAKE_ROOT}/Modules/ is checked
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${ECM_MODULE_PATH})

include(KDEInstallDirs)
include(KDECMakeSettings)
include(KDECompilerSettings NO_POLICY_SCOPE)
include(ECMSetupVersion)
include(ECMGenerateHeaders)
include(ECMPoQmTools)
include(KDEClangFormat)

if (QT_MAJOR_VERSION STREQUAL "6")
    set(REQUIRED_QT_VERSION "6.4")
    set(KF_MIN_VERSION "5.240.0")
    set(KF_MAJOR_VERSION "6")
endif()

################# Find dependencies #################
find_package(Qt${QT_MAJOR_VERSION} ${QT_MIN_VERSION} REQUIRED COMPONENTS Core Gui Qml QuickControls2 Svg Sql Widgets)
find_package(KF${QT_MAJOR_VERSION} ${KF_MIN_VERSION} REQUIRED COMPONENTS Kirigami2 I18n CoreAddons Declarative)

################# build and install #################
add_subdirectory(src)

add_definitions(-DQT_NO_CAST_FROM_ASCII -DQT_NO_CAST_TO_ASCII -DQT_NO_URL_CAST_FROM_STRING)
add_definitions(-DQT_USE_QSTRINGBUILDER)
add_definitions(-DQT_NO_NARROWING_CONVERSIONS_IN_CONNECT)
add_definitions(-DQT_DISABLE_DEPRECATED_BEFORE=0x050d00)

install(PROGRAMS org.kde.samegame.desktop DESTINATION ${KDE_INSTALL_APPDIR})
install(FILES org.kde.samegame.appdata.xml DESTINATION ${KDE_INSTALL_METAINFODIR})
#install(FILES org.kde.samegame.svg DESTINATION ${KDE_INSTALL_FULL_ICONDIR}/hicolor/scalable/apps)

feature_summary(WHAT ALL INCLUDE_QUIET_PACKAGES FATAL_ON_MISSING_REQUIRED_PACKAGES)

file(GLOB_RECURSE ALL_CLANG_FORMAT_SOURCE_FILES src/*.cpp src/*.h)
kde_clang_format(${ALL_CLANG_FORMAT_SOURCE_FILES})
        
