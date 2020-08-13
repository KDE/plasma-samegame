add_executable(samegame
    main.cpp
    resources.qrc
    ${samegame_SRCS})
    
target_link_libraries(samegame
    Qt5::Core
    Qt5::Gui
    Qt5::Qml
    Qt5::Quick
    Qt5::QuickControls2
    Qt5::Svg
    Qt5::Sql
    KF5::I18n
    KF5::CoreAddons)
    
install(TARGETS samegame ${KF5_INSTALL_TARGETS_DEFAULT_ARGS})
