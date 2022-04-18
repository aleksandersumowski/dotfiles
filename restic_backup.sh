#!/usr/bin/env bash

unset HISTFILE
source ~/.aws_restic_credentials
export RETENTION_DAYS=7
export RETENTION_WEEKS=4
export RETENTION_MONTHS=6
export RETENTION_YEARS=3
export AWS_BUCKET=s3:s3.amazonaws.com/aleks-backup-restic

/usr/local/bin/restic -r $AWS_BUCKET backup ~/Sync
/usr/local/bin/restic -r $AWS_BUCKET check
/usr/local/bin/restic -r $AWS_BUCKET forget --prune --cleanup-cache
/usr/local/bin/restic -r $AWS_BUCKET check
