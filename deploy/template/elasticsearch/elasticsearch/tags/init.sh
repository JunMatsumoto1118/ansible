#!/bin/bash -x

cd `dirname $0`
curl  -X PUT 'http://{{ groups["elasticsearch"][0] }}:9200/tags' -d @analysis.json
curl  -X PUT 'http://{{ groups["elasticsearch"][0] }}:9200/tags/tags/_mapping' -d @mapping.json
