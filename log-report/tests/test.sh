#!/bin/bash

set -u

mkdir -p /logs/verifier

pytest /tests/test_outputs.py -rA --ctrf /logs/verifier/ctrf.json
pytest_status=$?

if [ "$pytest_status" -eq 0 ]; then
    printf '1\n' > /logs/verifier/reward.txt
else
    printf '0\n' > /logs/verifier/reward.txt
fi

# Let Harbor collect reward.txt and ctrf.json even when pytest fails.
exit 0
