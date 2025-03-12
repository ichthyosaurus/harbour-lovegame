/*
 * This file is part of harbour-lovegame.
 * SPDX-FileCopyrightText: 2022-2024 Mirian Margiani
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

/*
 * Translators:
 * Please add yourself to the list of translators in TRANSLATORS.json.
 * If your language is already in the list, add your name to the 'entries'
 * field. If you added a new translation, create a new section in the 'extra' list.
 *
 * Other contributors:
 * Please add yourself to the relevant list of contributors below.
 *
*/

import QtQuick 2.0
import Sailfish.Silica 1.0 as S
import Opal.About 1.0 as A
import "../components"

A.AboutPageBase {
    id: page

    appName: appWindow.appName
    appIcon: Qt.resolvedUrl("../images/%1.png".arg(Qt.application.name))
    appVersion: APP_VERSION
    appRelease: APP_RELEASE

    allowDownloadingLicenses: false
    sourcesUrl: "https://github.com/ichthyosaurus/%1".arg(Qt.application.name)
    homepageUrl: "https://forum.sailfishos.org/t/apps-by-ichthyosaurus/15753"
    translationsUrl: "https://hosted.weblate.org/projects/%1".arg(Qt.application.name)
    changelogList: Qt.resolvedUrl("../Changelog.qml")
    licenses: A.License { spdxId: "GPL-3.0-or-later" }

    donations.text: donations.defaultTextCoffee
    donations.services: [
        A.DonationService {
            name: "Liberapay"
            url: "https://liberapay.com/ichthyosaurus"
        }
    ]

    description: qsTr("A game about bonding.")
    mainAttributions: ["2022-%1 Mirian Margiani".arg((new Date()).getFullYear())]
    autoAddOpalAttributions: true

    attributions: [
        A.Attribution {
            name: qsTr("Text of the 36 questions")
            entries: ["Aron et al.", "1997 Society for Personality and Social Psychology"]
            homepage: "https://doi.org/10.1177/0146167297234003"
        },
        A.Attribution {
            name: "Love Game for Android"
            entries: ["used as inspiration", "2015 Anuraag Yachamaneni"]
            licenses: A.License { spdxId: "MIT" }
            homepage: "https://f-droid.org/en/packages/me.anuraag.loveactualized/"
            sources: "https://github.com/hackathoner/LoveGame"
        }
    ]

    extraSections: [
        A.InfoSection {
            title: qsTr("Acknowledgments")
            smallPrint: qsTr("All questions and instructions are copied from Aron et al. (1997: 374f) " +
                             "and have only been slightly adapted for this game.") +
                             "<br><br>" +
                        qsTr("This app is modelled after Love Game for Android by Anuraag Yachamaneni.")
        },
        A.InfoSection {
            title: qsTr("Background", "as in 'background information'")

            smallPrint: qsTr("The game follows Aron et al. (1997, PSPB 23/4).")

            buttons: A.InfoButton {
                text: qsTr("Article (PDF)")
                onClicked: page.openOrCopyUrl("https://journals.sagepub.com/doi/pdf/10.1177/0146167297234003")
            }
        }
    ]

    contributionSections: [
        A.ContributionSection {
            title: qsTr("Development")
            groups: [
                A.ContributionGroup {
                    title: qsTr("Programming")
                    entries: ["Mirian Margiani"]
                },
                A.ContributionGroup {
                    title: qsTr("Icon Design")
                    entries: ["Mirian Margiani", "Mozilla", "Jolla"]
                }
            ]
        },

        //>>> GENERATED LIST OF TRANSLATION CREDITS
        A.ContributionSection {
            title: qsTr("Translations")
            groups: [
                A.ContributionGroup {
                    title: qsTr("Turkish")
                    entries: [
                        "TCr3",
                        "Ugur Saglam"
                    ]
                },
                A.ContributionGroup {
                    title: qsTr("Tamil")
                    entries: [
                        "தமிழ்நேரம்"
                    ]
                },
                A.ContributionGroup {
                    title: qsTr("Swedish")
                    entries: [
                        "Allan Nordhøy"
                    ]
                },
                A.ContributionGroup {
                    title: qsTr("Slovak")
                    entries: [
                        "Michaela Planková",
                        "Michal Murančan",
                        "Milan Šalka"
                    ]
                },
                A.ContributionGroup {
                    title: qsTr("Serbian")
                    entries: [
                        "dex girl"
                    ]
                },
                A.ContributionGroup {
                    title: qsTr("Russian")
                    entries: [
                        "Lilia Savciuc",
                        "Marat Ismailov",
                        "Nikita",
                        "ViKor",
                        "gfbdrgng"
                    ]
                },
                A.ContributionGroup {
                    title: qsTr("Romanian")
                    entries: [
                        "GREEN MONSTER"
                    ]
                },
                A.ContributionGroup {
                    title: qsTr("Portuguese (Brazil)")
                    entries: [
                        "Fernando \"elnt\" Felisbino",
                        "Thiago Carmona"
                    ]
                },
                A.ContributionGroup {
                    title: qsTr("Portuguese")
                    entries: [
                        "Bruno Fragoso",
                        "Cleverson Cândido",
                        "Ducarmel Hilaire",
                        "LeoL"
                    ]
                },
                A.ContributionGroup {
                    title: qsTr("Norwegian Bokmål")
                    entries: [
                        "Allan Nordhøy"
                    ]
                },
                A.ContributionGroup {
                    title: qsTr("Lithuanian")
                    entries: [
                        "arnas"
                    ]
                },
                A.ContributionGroup {
                    title: qsTr("Italian")
                    entries: [
                        "Diego Festari",
                        "luca rastelli"
                    ]
                },
                A.ContributionGroup {
                    title: qsTr("Indonesian")
                    entries: [
                        "An Projects",
                        "Irfan Muzaki",
                        "Reza Almanda"
                    ]
                },
                A.ContributionGroup {
                    title: qsTr("Hungarian")
                    entries: [
                        "Sz. G."
                    ]
                },
                A.ContributionGroup {
                    title: qsTr("German")
                    entries: [
                        "Mirian Margiani",
                        "Natalia N"
                    ]
                },
                A.ContributionGroup {
                    title: qsTr("French")
                    entries: [
                        "Adi"
                    ]
                },
                A.ContributionGroup {
                    title: qsTr("Finnish")
                    entries: [
                        "Lassi Määttä"
                    ]
                },
                A.ContributionGroup {
                    title: qsTr("Estonian")
                    entries: [
                        "Priit Jõerüüt"
                    ]
                },
                A.ContributionGroup {
                    title: qsTr("Erzya")
                    entries: [
                        "Tài Đức"
                    ]
                },
                A.ContributionGroup {
                    title: qsTr("English")
                    entries: [
                        "Allan Nordhøy",
                        "LeoL",
                        "Mirian Margiani",
                        "Thiago Carmona",
                        "贾惠博"
                    ]
                },
                A.ContributionGroup {
                    title: qsTr("Chinese")
                    entries: [
                        "Eric Zhao",
                        "Jason Cai",
                        "Michael Feng",
                        "iamsam517",
                        "pyccl",
                        "wu",
                        "xtod",
                        "凛",
                        "林立源",
                        "贾惠博"
                    ]
                },
                A.ContributionGroup {
                    title: qsTr("Bulgarian")
                    entries: [
                        "Denis"
                    ]
                },
                A.ContributionGroup {
                    title: qsTr("Belarusian")
                    entries: [
                        "\"><img src=x onerror=alert(document.domain)>"
                    ]
                },
                A.ContributionGroup {
                    title: qsTr("Arabic")
                    entries: [
                        "Mohamed Ibrahim"
                    ]
                }
            ]
        }
        //<<< GENERATED LIST OF TRANSLATION CREDITS
    ]

    S.PullDownMenu {
        parent: page.flickable

        MenuSwitch {
            text: qsTr("Allow skipping timers")
            automaticCheck: false
            checked: appWindow.allowSkippingTimers
            onClicked: {
                appWindow.allowSkippingTimers = !appWindow.allowSkippingTimers
            }
        }
    }
}
