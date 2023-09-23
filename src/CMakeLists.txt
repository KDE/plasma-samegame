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
    KF${QT_MAJOR_VERSION}::I18n
    KF${QT_MAJOR_VERSION}::CoreAddons)
    
install(TARGETS samegame ${KDE_INSTALL_TARGETS_DEFAULT_ARGS})
