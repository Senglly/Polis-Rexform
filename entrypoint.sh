#!/bin/sh
set -e

# Validate required environment variables before starting Polis.
# Fail fast with a clear message rather than a cryptic runtime error.

REQUIRED_VARS="
  DB_URL
  JACKSON_API_KEYS
  NEXTAUTH_URL
  NEXTAUTH_SECRET
  PRIVATE_KEY
  PUBLIC_KEY
  EXTERNAL_URL
  IDP_ENABLED
"

missing=""
for var in $REQUIRED_VARS; do
  eval val=\$$var
  if [ -z "$val" ]; then
    missing="$missing $var"
  fi
done

if [ -n "$missing" ]; then
  echo "ERROR: Missing required environment variables:$missing"
  exit 1
fi

echo "Polis configuration:"
echo "  External URL : $EXTERNAL_URL"
echo "  DB engine    : ${DB_ENGINE:-pg}"
echo "  IDP enabled  : $IDP_ENABLED"
echo "  NEXTAUTH_URL : $NEXTAUTH_URL"

exec "$@"
