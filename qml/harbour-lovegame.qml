/*
 * This file is part of harbour-lovegame.
 * SPDX-FileCopyrightText: 2022-2024 Mirian Margiani
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

import QtQuick 2.0
import Sailfish.Silica 1.0
import Nemo.KeepAlive 1.2
import QtMultimedia 5.0
import Opal.About 1.0 as A
import Opal.SupportMe 1.0 as M
import "pages"

ApplicationWindow {
    id: appWindow
    cover: Qt.resolvedUrl("cover/CoverPage.qml")

    initialPage: Component {
        IntroPage {}
    }

    // We have to explicitly set the \c _defaultPageOrientations property
    // to \c Orientation.All so the page stack's default placeholder page
    // will be allowed to be in landscape mode. (The default value is
    // \c Orientation.Portrait.) Without this setting, pushing multiple pages
    // to the stack using \c animatorPush() while in landscape mode will cause
    // the view to rotate back and forth between orientations.
    // [as of 2021-02-17, SFOS 3.4.0.24, sailfishsilica-qt5 version 1.1.110.3-1.33.3.jolla]
    _defaultPageOrientations: Orientation.All
    allowedOrientations: Orientation.All

    property bool allowSkippingTimers: false
    property int timerInterval: 4 * 60 * 1000

    readonly property string appName: qsTr("36 Questions")
    readonly property bool timerRunning: timer.running
    property QtObject _rumbleEffect

    // property var colorPalette: ['orange', 'darkgreen', 'indigo', 'darkred']
    property var colorPalette: ['#1C8200', '#F0CA4D', '#E37B40', '#DE5B49']

    property var questions: [
        /*  I. */ { 'isChapter': true,  'chapterIndex': 0, 'count': 12, 'text': qsTr('I.', 'as in "1st chapter"') },
        /*  1. */ { 'isChapter': false, 'text': qsTr('Given the choice of anyone in the world, whom would you want as a dinner guest?') },
        /*  2. */ { 'isChapter': false, 'text': qsTr('Would you like to be famous? In what way?') },
        /*  3. */ { 'isChapter': false, 'text': qsTr('Before making a telephone call, do you ever rehearse what you are going to say? Why?') },
        /*  4. */ { 'isChapter': false, 'text': qsTr('What would constitute a “perfect” day for you?') },
        /*  5. */ { 'isChapter': false, 'text': qsTr('When did you last sing to yourself? To someone else?') },
        /*  6. */ { 'isChapter': false, 'text': qsTr('If you were able to live to the age of 90 and retain either the mind or body of a 30-year-old for the last 60 years of your life, which would you want?') },
        /*  7. */ { 'isChapter': false, 'text': qsTr('Do you have a secret hunch about how you will die?') },
        /*  8. */ { 'isChapter': false, 'text': qsTr('Name three things you and your partner appear to have in common.') },
        /*  9. */ { 'isChapter': false, 'text': qsTr('For what in your life do you feel most grateful?') },
        /* 10. */ { 'isChapter': false, 'text': qsTr('If you could change anything about the way you were raised, what would it be?') },
        /* 11. */ { 'isChapter': false, 'text': qsTr('Take four minutes and tell your partner your life story in as much detail as possible.'), 'withTimer': true },
        /* 12. */ { 'isChapter': false, 'text': qsTr('If you could wake up tomorrow having gained any one quality or ability, what would it be?') },
        /* II. */ { 'isChapter': true,  'chapterIndex': 1, 'count': 12, 'text': qsTr('II.', 'as in "2nd chapter"') },
        /* 13. */ { 'isChapter': false, 'text': qsTr('If a crystal ball could tell you the truth about yourself, your life, the future or anything else, what would you want to know?') },
        /* 14. */ { 'isChapter': false, 'text': qsTr('Is there something that you’ve dreamed of doing for a long time? Why haven’t you done it?') },
        /* 15. */ { 'isChapter': false, 'text': qsTr('What is the greatest accomplishment of your life?') },
        /* 16. */ { 'isChapter': false, 'text': qsTr('What do you value most in a friendship?') },
        /* 17. */ { 'isChapter': false, 'text': qsTr('What is your most treasured memory?') },
        /* 18. */ { 'isChapter': false, 'text': qsTr('What is your most terrible memory?') },
        /* 19. */ { 'isChapter': false, 'text': qsTr('If you knew that in one year you would die suddenly, would you change anything about the way you are now living? Why?') },
        /* 20. */ { 'isChapter': false, 'text': qsTr('What does friendship mean to you?') },
        /* 21. */ { 'isChapter': false, 'text': qsTr('What roles do love and affection play in your life?') },
        /* 22. */ { 'isChapter': false, 'text': qsTr('Alternate sharing something you consider a positive characteristic of your partner. Share a total of five items.') },
        /* 23. */ { 'isChapter': false, 'text': qsTr('How close and warm is your family? Do you feel your childhood was happier than most other people’s?') },
        /* 24. */ { 'isChapter': false, 'text': qsTr('How do you feel about your relationship with your mother?') },
        /* III */ { 'isChapter': true,  'chapterIndex': 2, 'count': 14, 'text': qsTr('III.', 'as in "3rd chapter"') },
        /* 25. */ { 'isChapter': false, 'text': qsTr('Make three true “we” statements each. For instance, “We are both in this room feeling ...”') },
        /* 26. */ { 'isChapter': false, 'text': qsTr('Complete this sentence: “I wish I had someone with whom I could share ...”') },
        /* 27. */ { 'isChapter': false, 'text': qsTr('If you were going to become a close friend with your partner, please share what would be important for him or her to know.') },
        /* 31. */ { 'isChapter': false, 'text': qsTr('Tell your partner something that you like about them already.') },
        /* 29. */ { 'isChapter': false, 'text': qsTr('Share with your partner an embarrassing moment in your life.') },
        /* 30. */ { 'isChapter': false, 'text': qsTr('When did you last cry in front of another person? By yourself?') },
        /* 28. */ { 'isChapter': false, 'text': qsTr('Tell your partner what you like about them; be very honest this time, saying things that you might not say to someone you’ve just met.') },
        /* 32. */ { 'isChapter': false, 'text': qsTr('What, if anything, is too serious to be joked about?') },
        /* 33. */ { 'isChapter': false, 'text': qsTr('If you were to die this evening with no opportunity to communicate with anyone, what would you most regret not having told someone? Why haven’t you told them yet?') },
        /* 34. */ { 'isChapter': false, 'text': qsTr('Your house, containing everything you own, catches fire. After saving your loved ones and pets, you have time to safely make a final dash to save any one item. What would it be? Why?') },
        /* 35. */ { 'isChapter': false, 'text': qsTr('Of all the people in your family, whose death would you find most disturbing? Why?') },
        /* 36. */ { 'isChapter': false, 'text': qsTr('Share a personal problem and ask your partner’s advice on how he or she might handle it. Also, ask your partner to reflect back to you how you seem to be feeling about the problem you have chosen.') },

        /* END */ { 'isChapter': false, 'text': qsTr('Done?<br><br>Now look into the eyes of your partner silently for four minutes.'), 'withTimer': true },
        /*     */ { 'isChapter': false, 'text': '', 'returnHome': true },
    ]

    function startTimer() {
        timer.restart()
    }

    function stopTimer() {
        timer.stop()
    }

    Timer {
        id: timer
        interval: timerInterval
        running: false
        repeat: false
        onTriggered: {
            alarm.play()

            if (_rumbleEffect) {
                _multiTimer.laps = 3
                _multiTimer.callback = function() { _rumbleEffect.start() }
                _multiTimer.start()
            }
        }
    }

    Timer {
        id: _multiTimer
        property int laps: 3
        property int _lapsDone: 0
        property var callback: function() {}
        interval: 500
        repeat: true
        running: false

        triggeredOnStart: true
        onTriggered: {
            _lapsDone += 1

            if (_lapsDone > laps) {
                repeat = false
                running = false
                _lapsDone = 0
            } else {
                repeat = true
                callback()
            }
        }
    }

    Audio {
        id: alarm
        source: "/usr/share/sounds/jolla-ringtones/stereo/jolla-calendar-alarm.ogg"
    }

    DisplayBlanking {
        preventBlanking: true
    }

    KeepAlive {
        enabled: true
    }

    A.ChangelogNews {
        changelogList: Qt.resolvedUrl("Changelog.qml")
    }

    M.AskForSupport {
        contents: Component {
            MySupportDialog {}
        }
    }

    Component.onCompleted: {
        // Extensions that are not crucial and are generally not allowed in
        // Jolla's Harbour store are loaded dynamically. The app will handle
        // it gracefully if loading fails.

        // As of 2022-03-13, QtFeedback is not declared stable but may be
        // allowed in Harbour. Still, loading it dynamically may be safer because
        // then breaking the API does not break the whole app.
        // Cf. https://docs.sailfishos.org/Develop/Apps/Harbour/Allowed_APIs/#qtfeedback-hasnt-been-declared-stable-but-we-allow-a-restricted-part
        _rumbleEffect = Qt.createQmlObject("
                import QtQuick 2.0
                import QtFeedback 5.0
                HapticsEffect {
                    attackIntensity: 0.0
                    attackTime: 250
                    intensity: 1.0
                    duration: 400
                    fadeTime: 250
                    fadeIntensity: 0.0
                    period: 1000
                }", appWindow, 'RumbleEffect')
    }
}
