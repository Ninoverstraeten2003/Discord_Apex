#!/bin/sh
set -e

# Map Railway variables to expected variable names based on APP_DIR
if [ -z "$DISCORD_BOT_TOKEN" ]; then
  case "$APP_DIR" in
    apex)
      if [ -n "$DISCORD_BOT_TOKEN_MAP" ]; then
        export DISCORD_BOT_TOKEN="$DISCORD_BOT_TOKEN_MAP"
      fi
      ;;
    apex_daan)
      if [ -n "$DISCORD_BOT_TOKEN_DAAN" ]; then
        export DISCORD_BOT_TOKEN="$DISCORD_BOT_TOKEN_DAAN"
      fi
      if [ -n "$PLAYER_UID_DAAN" ]; then
        export PLAYER_UID="$PLAYER_UID_DAAN"
      fi
      ;;
    apex_eben)
      if [ -n "$DISCORD_BOT_TOKEN_EBEN" ]; then
        export DISCORD_BOT_TOKEN="$DISCORD_BOT_TOKEN_EBEN"
      fi
      if [ -n "$PLAYER_UID_EBEN" ]; then
        export PLAYER_UID="$PLAYER_UID_EBEN"
      fi
      ;;
    apex_nino)
      if [ -n "$DISCORD_BOT_TOKEN_NINO" ]; then
        export DISCORD_BOT_TOKEN="$DISCORD_BOT_TOKEN_NINO"
      fi
      if [ -n "$PLAYER_UID_NINO" ]; then
        export PLAYER_UID="$PLAYER_UID_NINO"
      fi
      ;;
  esac
fi

if [ -n "$STARTUP_DELAY" ]; then
  echo "Startup delay set to ${STARTUP_DELAY}s"
  sleep "$STARTUP_DELAY"
fi

exec "$@"

