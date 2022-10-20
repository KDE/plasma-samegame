add_executable(samegame
    main.cpp
    resources.qrc
    ${samegame_SRCS})
    
target_link_libraries(samegame
    Qt::Core
    Qt::Widgets
    Qt::Gui
    Qt::Qml
    Qt::Quick
    Qt::QuickControls2
    Qt::Svg
    Qt::Sql
    KF5::I18n
    KF5::CoreAddons)
    
install(TARGETS samegame ${KF5_INSTALL_TARGETS_DEFAULT_ARGS})
