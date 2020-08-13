/**
 * SPDX-FileCopyrightText: (C) 2020 Carl Schwan <carl@carlschwan.eu>
 * 
 * SPDX-LicenseRef: GPL-3.0-or-later
 */

import QtQuick 2.1
import org.kde.kirigami 2.12 as Kirigami
import QtQuick.Controls 2.14 as QQC2
import QtQuick.Window 2.14
import QtQuick.Layouts 1.14


Kirigami.ApplicationWindow {
    id: root

    
    Kirigami.PagePool {
        id: mainPagePool
    }

    pageStack.initialPage: mainPagePool.loadPage("MainPage.qml")
}
