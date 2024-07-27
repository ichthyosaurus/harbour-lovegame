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

    property int chapterIndex: 0
    property int chapterPageIndex: 0
    property int currentIndex: 0
    property int relativeIndex: 0
    property bool isGoodbyePage: currentItem.returnHome || false
    property bool isQuestion: !isGoodbyePage && !currentItem.isChapter

    readonly property color currentColor: appWindow.colorPalette[chapterIndex]
    readonly property color nextColor: appWindow.colorPalette[chapterIndex+1]
    readonly property color activeColor: Qt.tint(Theme.rgba(Qt.darker(currentColor), 1.0),
                                                 Theme.rgba(Qt.darker(nextColor), 1.0 /
                                                            currentChapter.count * relativeIndex))

    readonly property var currentChapter: appWindow.questions[chapterPageIndex]
    readonly property var currentItem: appWindow.questions[currentIndex]

    property bool _timerDone: !currentItem.withTimer
    canNavigateForward: _timerDone && !appWindow.timerRunning

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
        contentHeight: root.height
        VerticalScrollDecorator { flickable: flick }

        Item {
            visible: isGoodbyePage
            width: parent.width

            anchors {
                verticalCenter: parent.verticalCenter
                verticalCenterOffset: -1.5 * Theme.itemSizeHuge
            }

            InfoLabel {
                id: byeLabel
                text: qsTr("END")
                color: palette.primaryColor

                font {
                    pixelSize: Theme.fontSizeHuge * 1.5
                    family: Theme.fontFamilyHeading
                    bold: true
                }
            }

            Text {
                x: 2 * Theme.horizontalPageMargin
                anchors.top: byeLabel.bottom
                width: root.width - 4 * Theme.horizontalPageMargin
                horizontalAlignment: Text.AlignHCenter
                wrapMode: Text.Wrap

                font {
                    pixelSize: Theme.fontSizeHuge
                    family: Theme.fontFamilyHeading
                }

                color: palette.primaryColor
                opacity: Theme.opacityLow

                text: qsTr("Have a pleasant day!",
                           "translate as plural as two people are addressed")
            }
        }

        Item {
            visible: currentItem.isChapter
            width: parent.width

            anchors {
                verticalCenter: parent.verticalCenter
                verticalCenterOffset: -1.5 * Theme.itemSizeHuge
            }

            InfoLabel {
                id: titleLabel
                text: currentItem.text
                color: palette.primaryColor

                font {
                    pixelSize: Theme.fontSizeHuge * 1.5
                    family: Theme.fontFamilyHeading
                    bold: true
                }
            }

            Text {
                x: Theme.horizontalPageMargin
                anchors.top: titleLabel.bottom
                width: root.width - 2 * Theme.horizontalPageMargin
                horizontalAlignment: Text.AlignHCenter
                wrapMode: Text.Wrap

                font {
                    pixelSize: Theme.fontSizeHuge
                    family: Theme.fontFamilyHeading
                }

                color: palette.primaryColor
                opacity: Theme.opacityLow

                text: qsTr("Chapter", "as in '1st Chapter'")
            }
        }

        Label {
            id: textLabel
            anchors {
                top: parent.top
                left: parent.left; right: parent.right
                bottom: parent.bottom
                margins: Theme.itemSizeSmall
            }

            visible: isQuestion
            text: qsTr("<b>%1.</b> %2", "as in '<b>10.</b> Ask your partner...").arg(
                       currentIndex - chapterIndex).arg(currentItem.text)

            color: palette.primaryColor
            wrapMode: Text.WordWrap
            font.pixelSize: Theme.fontSizeHuge
            fontSizeMode: Text.VerticalFit

            states: State {
                when: currentItem.withTimer
                AnchorChanges {
                    target: textLabel
                    anchors.bottom: timerButton.top
                }
            }
        }

        Button {
            id: restartButton
            visible: isGoodbyePage
            text: qsTr("Restart")
            preferredWidth: Theme.buttonWidthLarge

            anchors {
                bottom: parent.bottom
                bottomMargin: Theme.itemSizeSmall
                horizontalCenter: parent.horizontalCenter
            }

            onClicked: {
                // Silica bug: pageStack.pop(null) should pop back
                // to the first page but instead if only pops two pages.
                pageStack.replaceAbove(null, appWindow.initialPage)
            }
        }

        Button {
            id: timerButton
            enabled: !appWindow.timerRunning || appWindow.allowSkippingTimers
            preferredWidth: Theme.buttonWidthLarge

            anchors {
                bottom: parent.bottom
                bottomMargin: Theme.itemSizeSmall
                horizontalCenter: parent.horizontalCenter
            }

            visible: currentItem.withTimer ? true : false
            text: qsTr("Start timer")
            onClicked: {
                if (!appWindow.timerRunning) {
                    text = String(Math.floor(progressTimer.secondsLeft / 60)) +
                           ":" + (progressTimer.secondsLeft % 60 < 10 ? "0" : "") +
                           String(progressTimer.secondsLeft % 60)
                    appWindow.startTimer()
                } else {
                    appWindow.stopTimer()
                }
                _timerDone = true
            }

            Connections {
                target: appWindow
                onTimerRunningChanged: {
                    if (!appWindow.timerRunning) {
                        timerButton.text = qsTr("Start timer")
                        progressTimer.secondsLeft = appWindow.timerInterval / 1000
                    }
                }
            }

            Timer {
                id: progressTimer
                property int secondsLeft: appWindow.timerInterval / 1000

                interval: 1000
                repeat: true
                running: appWindow.timerRunning
                onTriggered: {
                    secondsLeft -= 1
                    timerButton.text =
                        String(Math.floor(secondsLeft / 60)) +
                        ":" + (secondsLeft % 60 < 10 ? "0" : "") +
                        String(secondsLeft % 60)
                }
            }

            Item {
                id: buttonBusyIndicator
                visible: appWindow.timerRunning
                width: parent.width / 3
                height: 3
                anchors.bottom: parent.bottom

                SmoothedAnimation {
                    id: busyAnimation
                    target: buttonBusyIndicator
                    property: 'x'
                    from: 0
                    to: timerButton.width - buttonBusyIndicator.width
                    running: buttonBusyIndicator.visible
                    velocity: 50

                    onStopped: {
                        var oldFrom = from
                        from = to
                        to = oldFrom
                        restart()
                    }
                }

                Rectangle {
                    anchors {
                        bottom: parent.bottom
                        right: parent.left
                        bottomMargin: -height/2 + width/2
                        rightMargin: -height/2
                    }

                    width: parent.height
                    height: parent.width
                    rotation: 90

                    gradient: Gradient {
                        GradientStop {
                            position: 0.0
                            color: Theme.rgba(palette.primaryColor, 0.0)
                        }
                        GradientStop {
                            position: 0.5
                            color: Theme.rgba(palette.primaryColor, 1.0)
                        }
                        GradientStop {
                            position: 1.0
                            color: Theme.rgba(palette.primaryColor, 0.0)
                        }
                    }
                }
            }

        }
    }

    onStatusChanged: {
        if (status === PageStatus.Active && currentIndex+1 < appWindow.questions.length) {
            pageStack.pushAttached(Qt.resolvedUrl('QuestionPage.qml'), {
                'currentIndex': currentIndex + 1,
                'relativeIndex': (currentItem.isChapter ? 0 : relativeIndex + 1),
                'chapterIndex': (currentItem.isChapter ? currentItem.chapterIndex : chapterIndex),
                'chapterPageIndex': (currentItem.isChapter ? currentIndex : chapterPageIndex)
            })
        }
    }
}
