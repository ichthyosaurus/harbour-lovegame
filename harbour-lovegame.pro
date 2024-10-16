# This file is part of harbour-lovegame.
# SPDX-FileCopyrightText: 2022-2024 Mirian Margiani
# SPDX-License-Identifier: GPL-3.0-or-later

# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed
TARGET = harbour-lovegame
CONFIG += sailfishapp

# Note: version number is configured in yaml
DEFINES += APP_VERSION=\\\"$$VERSION\\\"
DEFINES += APP_RELEASE=\\\"$$RELEASE\\\"
include(libs/opal-cached-defines.pri)

QML_IMPORT_PATH += qml/modules

SOURCES += src/harbour-lovegame.cpp

DISTFILES += qml/harbour-lovegame.qml \
    qml/cover/CoverPage.qml \
    qml/pages/QuestionPage.qml \
    qml/pages/IntroPage.qml \
    qml/pages/AboutPage.qml \
    qml/images/*.png \
    qml/modules/Opal/About/*.qml \
    qml/modules/Opal/About/private/*.qml \
    qml/modules/Opal/About/private/*.js \
    rpm/harbour-lovegame.changes.in \
    rpm/harbour-lovegame.changes.run.in \
    rpm/harbour-lovegame.spec \
    rpm/harbour-lovegame.yaml \
    translations/*.ts \
    harbour-lovegame.desktop

SAILFISHAPP_ICONS = 86x86 108x108 128x128 172x172

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n
TRANSLATIONS += translations/harbour-lovegame-*.ts
