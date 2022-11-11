#! /bin/sh
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

MOZ_APP_NAME=borealis
MOZ_APP_VENDOR="Binary Outcast"
MOZ_APP_BASENAME=Borealis
MOZ_APP_DISPLAYNAME=$MOZ_APP_BASENAME
BINOC_NAVIGATOR=1
BINOC_DOWNLOADS=1
MOZ_BRANDING_DIRECTORY=apps/navigator/branding
MOZ_OFFICIAL_BRANDING_DIRECTORY=other-licenses/branding/borealis
MOZ_UPDATER=
# This should usually be the same as the value MAR_CHANNEL_ID.
# If more than one ID is needed, then you should use a comma separated list
# of values.
ACCEPTED_MAR_CHANNEL_IDS=release,beta,trunk
# The MAR_CHANNEL_ID must not contain the following 3 characters: ",\t "
MAR_CHANNEL_ID=release

MOZ_APP_VERSION=`$PYTHON ${_topsrcdir}/build/version2k.py --version ${_topsrcdir}/apps/navigator/config/version.txt`
MOZ_APP_VERSION_DISPLAY=$MOZ_APP_VERSION

# MOZ_APP_ID={a3210b97-8e8a-4737-9aa0-aa0e607640b9}
MOZ_APP_ID={86c18b42-e466-4580-8b97-957ad5f8ea47}
MOZ_PROFILE_MIGRATOR=1
MOZ_APP_STATIC_INI=1
MOZ_SEPARATE_MANIFEST_FOR_THEME_OVERRIDES=1
MOZ_WEBGL_CONFORMANT=1
MOZ_SERVICES_SYNC=
MOZ_JETPACK=
MOZ_DEVTOOLS_SERVER=
MOZ_DEVTOOLS=
MOZ_GAMEPAD=
MOZ_NECKO_WIFI=
