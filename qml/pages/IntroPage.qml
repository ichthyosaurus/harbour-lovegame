/*
 * This file is part of harbour-lovegame.
 * SPDX-FileCopyrightText: 2022-2024 Mirian Margiani
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

import QtQuick 2.6
import Sailfish.Silica 1.0

Page {
    id: root
    allowedOrientations: Orientation.All

    readonly property var firstItem: appWindow.questions[0]
    readonly property color currentColor: appWindow.colorPalette[0]
    readonly property color activeColor: Theme.rgba(Qt.darker(currentColor, 2.5), 1.0)

    palette {
        colorScheme: Theme.LightOnDark
        primaryColor: "white"
        secondaryColor: "white"
        highlightColor: "white"
    }

    Rectangle {
        id: bgItem
        anchors.fill: parent
        color: activeColor
    }

    SilicaFlickable {
        id: flick
        anchors.fill: parent
        contentHeight: column.height + 2 * Theme.itemSizeSmall
        VerticalScrollDecorator { flickable: flick }

        pullDownMenu: PullDownMenu {
            flickable: flick

            MenuItem {
                text: qsTr("About")
                onClicked: pageStack.animatorPush(Qt.resolvedUrl("AboutPage.qml"))
            }
        }

        Column {
            id: column
            anchors {
                top: parent.top
                left: parent.left
                right: parent.right
                margins: Theme.itemSizeSmall
            }

            spacing: Theme.paddingLarge

            Label {
                width: parent.width
                wrapMode: Text.Wrap
                font {
                    pixelSize: Theme.fontSizeHuge
                    family: Theme.fontFamilyHeading
                }

                text: qsTr("How to play")
            }

            Label {
                text: qsTr("This game is about getting close to another person " +
                           "through sharing.")
                width: parent.width
                wrapMode: Text.Wrap
                font.pixelSize: Theme.fontSizeLarge
            }

            // SOURCE: the instructions are a copy of the instructions at
            //         Aron et al. (1997: p. 374). The wording has been
            //         slightly adapted for this game.

            Label {
                text: qsTr("You will be given 36 tasks. One of you should read one " +
                           "aloud, and then <b>both</b> do what it asks, starting with " +
                           "the person who read the task aloud.")
                width: parent.width
                wrapMode: Text.Wrap
                font.pixelSize: Theme.fontSizeLarge
            }

            Label {
                text: qsTr("Alternate with reading each question to your partner. If it asks " +
                           "you a question, share your answer, then let them share " +
                           "their answer with you. If it is a task, do it first, " +
                           "then let your partner do it.")
                width: parent.width
                wrapMode: Text.Wrap
                font.pixelSize: Theme.fontSizeLarge
            }

            Label {
                text: qsTr("Take plenty of time with each item, doing what it asks " +
                           "thoroughly and thoughtfully - but <b>do not skip</b> any item.")
                width: parent.width
                wrapMode: Text.Wrap
                font.pixelSize: Theme.fontSizeLarge
            }

            Item { width: parent.width; height: Theme.paddingLarge }

            Button {
                preferredWidth: Theme.buttonWidthLarge
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Let's go!")
                onClicked: pageStack.push(Qt.resolvedUrl("QuestionPage.qml"))
            }

            Item { width: parent.width; height: Theme.paddingLarge }
        }
    }
}
