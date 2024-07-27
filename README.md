<!--
SPDX-FileCopyrightText: 2018-2024 Mirian Margiani
SPDX-License-Identifier: GFDL-1.3-or-later
-->

![36 Questions banner](dist/banner-small.png)

# 36 Questions for Sailfish OS

[![Liberapay donations](https://img.shields.io/liberapay/receives/ichthyosaurus)](https://liberapay.com/ichthyosaurus)
[![Translations](https://hosted.weblate.org/widgets/harbour-lovegame/-/translations/svg-badge.svg)](https://hosted.weblate.org/projects/harbour-lovegame/translations/)
[![Source code license](https://img.shields.io/badge/source_code-GPL--3.0--or--later-yellowdarkgreen)](https://github.com/ichthyosaurus/harbour-lovegame/tree/main/LICENSES)
[![REUSE status](https://api.reuse.software/badge/github.com/ichthyosaurus/harbour-lovegame)](https://api.reuse.software/info/github.com/ichthyosaurus/harbour-lovegame)
[![Development status](https://img.shields.io/badge/development-stable-blue)](https://github.com/ichthyosaurus/harbour-lovegame)



36 Questions is a game about bonding.


Connect with another person on a deeply personal level by sharing answers
to a series of questions.

36 Questions uses the 36 questions developed in Aron et al. (1997, PSPB 23/4)
([DOI 10.1177/0146167297234003](https://doi.org/10.1177/0146167297234003),
[PDF](https://journals.sagepub.com/doi/pdf/10.1177/0146167297234003)).
The game is inspired by [Love Game for Android](https://github.com/hackathoner/LoveGame)
by Anuraag Yachamaneni.

## Permissions

36 Questions requires the following permissions:

- Audio: to play notification sounds when timers expire




## Help and support

You are welcome to [leave a comment in the forum](https://forum.sailfishos.org/t/apps-by-ichthyosaurus/15753)
if you have any questions or ideas.


## Translations

It would be wonderful if the app could be translated in as many languages as possible!

Translations are managed using
[Weblate](https://hosted.weblate.org/projects/harbour-lovegame/translations).
Please prefer this over pull request (which are still welcome, of course).
If you just found a minor problem, you can also
[leave a comment in the forum](https://forum.sailfishos.org/t/apps-by-ichthyosaurus/15753)
or [open an issue](https://github.com/ichthyosaurus/harbour-lovegame/issues/new).

Please include the following details:

1. the language you were using
2. where you found the error
3. the incorrect text
4. the correct translation


### Manually updating translations

Please prefer using
[Weblate](https://hosted.weblate.org/projects/harbour-lovegame) over this.
You can follow these steps to manually add or update a translation:

1. *If it did not exist before*, create a new catalog for your language by copying the
   base file [translations/harbour-lovegame.ts](translations/harbour-lovegame.ts).
   Then add the new translation to [harbour-lovegame.pro](harbour-lovegame.pro).
2. Add yourself to the list of contributors in [qml/pages/AboutPage.qml](qml/pages/AboutPage.qml).
3. (optional) Translate the app's name in [harbour-lovegame.desktop](harbour-lovegame.desktop)
   if there is a (short) native term for it in your language.

See [the Qt documentation](https://doc.qt.io/qt-5/qml-qtqml-date.html#details) for
details on how to translate date formats to your *local* format.


## Building and contributing

*Bug reports, and contributions for translations, bug fixes, or new features are always welcome!*

1. Clone the repository by running `git clone https://github.com/ichthyosaurus/harbour-lovegame.git`
2. Open `harbour-lovegame.pro` in Sailfish OS IDE (Qt Creator for Sailfish)
3. To run on emulator, select the `i486` target and press the run button
4. To build for the device, select the `armv7hl` target and click “deploy all”;
   the RPM packages will be in the `RPMS` folder

If you contribute, please do not forget to add yourself to the list of
contributors in [qml/pages/AboutPage.qml](qml/pages/AboutPage.qml)!




## Donations

If you want to support my work, I am always happy if you buy me a cup of coffee
through [Liberapay](https://liberapay.com/ichthyosaurus).

Of course it would be much appreciated as well if you support this project by
contributing to translations or code! See above how you can contribute 🎕.


## License

> Copyright (C) 2022-2024  Mirian Margiani

36 Questions is Free Software released under the terms of the
[GNU General Public License v3 (or later)](https://spdx.org/licenses/GPL-3.0-or-later.html).
The source code is available [on Github](https://github.com/ichthyosaurus/harbour-lovegame).
All documentation is released under the terms of the
[GNU Free Documentation License v1.3 (or later)](https://spdx.org/licenses/GFDL-1.3-or-later.html).

This project follows the [REUSE specification](https://api.reuse.software/info/github.com/ichthyosaurus/harbour-lovegame).
