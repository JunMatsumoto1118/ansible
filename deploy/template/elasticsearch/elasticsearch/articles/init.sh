#!/bin/bash -x

cd `dirname $0`
curl  -X PUT 'http://{{ groups["elasticsearch"][0] }}:9200/articles' -d @analysis.json
curl  -X PUT 'http://{{ groups["elasticsearch"][0] }}:9200/articles/articles/_mapping' -d @mapping.json
