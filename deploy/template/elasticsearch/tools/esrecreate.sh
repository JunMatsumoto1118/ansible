#!/bin/bash

FULL=false
while getopts "f" OPT
do
  case $OPT in
    "f" ) FULL=true ;;
  esac
done

if $FULL; then
  curl http://{{ groups["app"][0] }}:8001/api/batch/articles/es/recreate
else
  date=`date -d "15 days ago" "+%Y-%m-%d"`
  curl "http://{{ groups["app"][0] }}:8001/api/batch/articles/es/recreate?start_date=${date}"
fi

curl http://{{ groups["app"][0] }}:8001/api/batch/companies/es/recreate
curl http://{{ groups["app"][0] }}:8001/api/batch/tags/es/recreate
curl http://{{ groups["app"][0] }}:8001/api/batch/features/es/recreate
curl http://{{ groups["app"][0] }}:8001/api/batch/series/es/recreate
