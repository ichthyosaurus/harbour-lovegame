/*
 * This file is part of harbour-lovegame.
 * SPDX-FileCopyrightText: 2022-2024 Mirian Margiani
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

import QtQuick 2.2
import Sailfish.Silica 1.0

CoverBackground {
    id: root
    property bool isContent: !!pageStack.currentPage.activeColor || false

    Rectangle {
        visible: isContent
        anchors.fill: parent
        color: pageStack.currentPage.activeColor || "transparent"
    }

    CoverPlaceholder {
        icon.source: "../images/harbour-lovegame.png"
        text: appWindow.appName
    }
}
