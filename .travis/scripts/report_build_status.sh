#!/bin/bash
# report_build_status.sh: to report which packages were attempted and how many got failed

ATTEMPT_LOG=/tmp/packages_attempted.txt
FAIL_LOG=/tmp/packages_failed.txt

echo "packages attempted: $(wc -l $ATTEMPT_LOG)"
cat $ATTEMPT_LOG

if [ ! -f "$FAIL_LOG" ]; then
	echo "packages failed: none"
else
	echo "packages failed: $(wc -l $FAIL_LOG)"
	cat $FAIL_LOG
fi
