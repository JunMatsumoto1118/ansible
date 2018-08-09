#!/bin/bash -x

cd `dirname $0`
curl  -X PUT 'http://{{ groups["elasticsearch"][0] }}:9200/companies' -d @analysis.json
curl  -X PUT 'http://{{ groups["elasticsearch"][0] }}:9200/companies/companies/_mapping' -d @mapping.json
