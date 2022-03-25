#!/bin/sh

BINOC_SYSTEM=`uname | tr [:upper:] [:lower:]`
BINOC_PYTHON=`which python2.7 2>/dev/null`
BINOC_GIT=`which git 2>/dev/null`
BINOC_CURL=`which curl 2>/dev/null`
BINOC_MACH=mozmach
BINOC_CONFIG_GUESS=`./build/autoconf/config.guess 2>/dev/null`

# =============================================================================

if [ -z "$BINOC_PYTHON" ]; then
  printf "We could not find Python 2.7 which is required for just about everything!\n"
  exit 1
fi

# =============================================================================

# Determin the current OS
# This will also be exported so it can be picked up by .mozconfig
if [[ "$BINOC_SYSTEM" == "mingw32_nt-"* ]]; then
  BINOC_SYSTEM=windows
  
  if [ "$BINOC_CONFIG_GUESS" == "x86_64-pc-mingw32" ]; then
    BINOC_CONFIG_GUESS=win64
  else
    BINOC_CONFIG_GUESS=win32
  fi
fi

export BINOC_SYSTEM=$BINOC_SYSTEM
export BINOC_CONFIG_GUESS=$BINOC_CONFIG_GUESS

# =============================================================================

$BINOC_MACH $@
