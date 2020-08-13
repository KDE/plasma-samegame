/**
 * SPDX-FileCopyrightText: (C) 2013 Digia Plc and/or its subsidiary(-ies)
 * 
 * SPDX-LicenseRef: BSD-3-Clause
 */

import QtQuick 2.0
import QtQuick.Window 2.14
import org.kde.kirigami 2.12 as Kirigami
import QtQuick.Controls 2.14 as QQC2
import QtQuick.Layouts 1.14
import "samegame.js" as SameGame

Kirigami.Page {
    id: root
    title: i18n("Samegame")
    globalToolBarStyle: Kirigami.ApplicationHeaderStyle.None

    background: Image {
        id: background
        anchors.fill: parent
        source: "qrc:///shared/pics/background.jpg"
        fillMode: Image.PreserveAspectCrop
    }

    Item {
        id: gameCanvas
        property int score: 0
        property int blockSize: width / 8

        Component.onCompleted: console.log(width)

        anchors.centerIn: parent
        anchors.fill: parent

        MouseArea {
            anchors.fill: parent; onClicked: SameGame.handleClick(mouse.x,mouse.y);
        }
    }

    Dialog {
        id: dialog
        anchors.centerIn: parent
        z: 100
    }

    //![0]
    Dialog {
        id: nameInputDialog
        anchors.centerIn: parent
        z: 100

        onClosed: {
            if (nameInputDialog.inputText.length > 0) {
                SameGame.saveHighScore(nameInputDialog.inputText);
            }
        }
    }
    //![0]

    footer: QQC2.ToolBar {
        id: toolBar
        RowLayout {
            anchors.fill: parent
            QQC2.ToolButton {
                text: i18n("New Game")
                onClicked: SameGame.startNewGame()
            }

            QQC2.ToolButton {
                text: i18n("Quit")
                onClicked: Qt.quit()
            }

            QQC2.Label {
                text: i18n("Score: ") + gameCanvas.score
            }
        }
    }
}
