#!/bin/bash -x

cd `dirname $0`
curl  -X PUT 'http://{{ groups["elasticsearch"][0] }}:9200/features' -d @analysis.json
curl  -X PUT 'http://{{ groups["elasticsearch"][0] }}:9200/features/features/_mapping' -d @mapping.json
