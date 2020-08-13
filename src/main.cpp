/*
 * SPDX-FileCopyrightText: (C) 2020 Carl Schwan <carl@carlschwan.eu>
 * 
 * SPDX-LicenseRef: GPL-3.0-or-later
 */
#include <QApplication>
#include <QCommandLineParser>
#include <QQmlApplicationEngine>
#include <QtQml>
#include <QUrl>
#include <QIcon>
#include <QDebug>
#include <KLocalizedContext>
#include <KAboutData>
#include <KLocalizedString>

Q_DECL_EXPORT int main(int argc, char *argv[])
{
    KLocalizedString::setApplicationDomain("samegame");
    QGuiApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QApplication app(argc, argv);
    app.setApplicationName("Samegame");
    
    KAboutData aboutData("samegame", xi18nc("@title", "Kontrast"), "1.0",
                         xi18nc("@title", "A contrast checker application"),
                         KAboutLicense::GPL_V3);
    
    aboutData.addAuthor(xi18nc("@info:credit", "Sebastian Kügler"), xi18nc("@info:credit", "Creator"), "sebas@kde.org");
    aboutData.addAuthor(xi18nc("@info:credit", "Carl Schwan"), xi18nc("@info:credit", "Maintainer"), "carl@carlschwan.eu", "https://carlschwan.eu");

    KAboutData::setApplicationData(aboutData);
    QApplication::setWindowIcon(QIcon::fromTheme(QStringLiteral("org.kde.samegame")));

    QCommandLineParser parser;
    aboutData.setupCommandLine(&parser);
    parser.process(app);
    aboutData.processCommandLine(&parser);

    QQmlApplicationEngine engine;
    
    engine.rootContext()->setContextObject(new KLocalizedContext(&engine));
    engine.load(QUrl(QStringLiteral("qrc:///samegame.qml")));

    if (engine.rootObjects().isEmpty()) {
        return -1;
    }

    return app.exec();
}
