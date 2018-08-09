#!/bin/bash -x

cd `dirname $0`
curl  -X PUT 'http://{{ groups["elasticsearch"][0] }}:9200/series' -d @analysis.json
curl  -X PUT 'http://{{ groups["elasticsearch"][0] }}:9200/series/series/_mapping' -d @mapping.json
