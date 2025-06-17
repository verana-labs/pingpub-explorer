#!/bin/bash

set -e

VERANA_JSON_PATH="./chains/mainnet/verana.json"
UPDATED_JSON_PATH="./chains/mainnet/verana-updated.json"

mkdir -p ./chains/mainnet

jq --arg rpc_raw "$1" \
   --arg api_raw "$2" \
   --arg chain_name "$3" \
   --arg chain_id "$4" \
   '
   .rpc = ($rpc_raw | fromjson) |
   .api = ($api_raw | fromjson) |
   .chain_name = $chain_name |
   .chain_id = $chain_id
   ' "$VERANA_JSON_PATH" > "$UPDATED_JSON_PATH"

cat "$UPDATED_JSON_PATH"
mv "$UPDATED_JSON_PATH" "$VERANA_JSON_PATH"
