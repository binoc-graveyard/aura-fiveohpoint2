#! /bin/sh
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# Application
MOZ_APP_NAME=interlink
MOZ_APP_VENDOR="Binary Outcast"
MOZ_APP_BASENAME=Interlink
MOZ_APP_DISPLAYNAME=$MOZ_APP_BASENAME
MOZ_APP_ID={3550f703-e582-4d05-9a08-453d09bdfdc6}
MOZ_APP_STATIC_INI=1
MOZ_APP_VERSION=`$PYTHON ${_topsrcdir}/build/version2k.py --version ${_topsrcdir}/apps/mail/config/version.txt`
MOZ_APP_VERSION_DISPLAY=$MOZ_APP_VERSION
MOZ_BRANDING_DIRECTORY=mail/branding
MOZ_OFFICIAL_BRANDING_DIRECTORY=other-licenses/branding/interlink
MOZ_PROFILE_MIGRATOR=1

# Platform Conditional code for application
BINOC_MAIL=1
BINOC_DOWNLOADS=1

# Comm build options
MOZ_MAILNEWS=1
MOZ_MAILNEWS_OAUTH2=1
MOZ_COMPOSER=1
MOZ_CALENDAR=1
MOZ_WEBGL_CONFORMANT=1
THUNDERBIRD_VERSION=$MOZ_APP_VERSION

# Platform build options
MOZ_PLACES=1
MOZ_SEPARATE_MANIFEST_FOR_THEME_OVERRIDES=1
MOZ_SERVICES_SYNC=
MOZ_JETPACK=
MOZ_DEVTOOLS_SERVER=
MOZ_DEVTOOLS=
MOZ_GAMEPAD=
MOZ_NECKO_WIFI=
MOZ_AV1=

# This should usually be the same as the value MAR_CHANNEL_ID.
# If more than one ID is needed, then you should use a comma separated list
# of values.
ACCEPTED_MAR_CHANNEL_IDS=release,beta,trunk
# The MAR_CHANNEL_ID must not contain the following 3 characters: ",\t "
MAR_CHANNEL_ID=release
