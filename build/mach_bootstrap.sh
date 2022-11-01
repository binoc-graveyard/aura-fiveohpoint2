#!/bin/bash
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# =====================================================================================================================

BINOC_PYTHON=`which python2.7 2>/dev/null`

if [ -z "$BINOC_PYTHON" ]; then
  printf "We could not find Python 2.7 which is required for just about everything!\n"
  exit 1
fi

BINOC_TARGET_OS=`uname | tr [:upper:] [:lower:]`
BINOC_GIT=`which git 2>/dev/null`
BINOC_CURL=`which curl 2>/dev/null`

# Determine the current OS
# This will also be exported so it can be picked up by .mozconfig
if [[ "$BINOC_TARGET_OS" == "mingw32_nt-"* ]]; then
  BINOC_TARGET_OS=winnt
fi

export _BUILD_TARGET_OS=$BINOC_TARGET_OS

# =====================================================================================================================

case $1 in
  "build-release" | "localbuild" | "superclobber" | "version" | "webpatch" | "amend-author")
    if [[ "$1" == "build-release" ]]; then
      $BINOC_PYTHON mach build && $BINOC_PYTHON mach package && $BINOC_PYTHON mach mar --bz2 && $BINOC_PYTHON mach langpack && $BINOC_PYTHON mach theme
      if [[ "$BINOC_TARGET_OS" == "winnt" ]]; then
        $BINOC_PYTHON mach installer
      fi
    elif [ "$1" == "localbuild" ]; then
      # This builds and stages the application in dist/MOZ_APP_NAME but does not
      # actually generate an archive or any of the other stuff
      $BINOC_PYTHON mach build
      if [[ "$BINOC_TARGET_OS" == "winnt" ]]; then
        $BINOC_PYTHON mach installer && $BINOC_PYTHON mach install
      else
        $BINOC_PYTHON mach stage
      fi
    elif [[ "$1" == "superclobber" && -d "../.obj" ]]; then
      printf "Removing all object directories in ../.obj"
      rm -rf ../.obj/*
    elif [ "$1" == "version" ]; then
      # This will execute version2k.py and pass any remaining args to it
      $BINOC_PYTHON ./build/version2k.py ${@:2}
    elif [[ "$1" == "webpatch" ]] && [[ -n "$BINOC_GIT" ]] && [[ -n "$BINOC_CURL" ]]; then
      if [ -z "$2" ]; then
        printf "Patch with what?"
        exit 1
      else
        if [[ "$2" == *"github.com"* ]] ||
           [[ "$2" == *"code.binaryoutcast.com"* ]] ||
           [[ "$2" == *"repo.palemoon.org"* ]]; then
          echo ${2}.patch
          $BINOC_CURL -L ${2}.patch | "$BINOC_GIT" apply --reject
        else
          $BINOC_CURL -L ${2} | "$BINOC_GIT" apply --reject
        fi
      fi
    elif [[ "$1" == "amend-author" ]]; then
      if [[ -z "$2" ]]; then
        printf "Amend author on commit with what? (First Last <email@domain.tld>"
        exit 1
      fi
      "$BINOC_GIT" commit --amend --no-edit --author "$(echo ${@:2})"
    fi

    exit 0
  ;;
esac

# =====================================================================================================================
