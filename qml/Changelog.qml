/*
 * This file is part of harbour-lovegame.
 * SPDX-FileCopyrightText: Mirian Margiani
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

import QtQuick 2.0
import "modules/Opal/About"

ChangelogList {
    ChangelogItem {
        version: "1.1.1-1"
        date: "2024-08-10"
        paragraphs: [
            "- Updated translations: German<br>" +
            "- Switched Q28 and Q31 because it makes more sense than the original order"
        ]
    }
    ChangelogItem {
        version: "1.1.0-1"
        date: "2024-08-09"
        paragraphs: [
            "- Added and updated translations: German, Spanish, Indonesian, Ukrainian, Hungarian, Chinese"
        ]
    }
    ChangelogItem {
        version: "1.0.1-1"
        date: "2024-07-27"
        paragraphs: [
            "- initial public release"
        ]
    }
    ChangelogItem {
        version: '1.0.0-1'
        date: "2022-05-01"
        paragraphs: [
            '- initial version'
        ]
    }
}
