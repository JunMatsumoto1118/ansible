#!/usr/bin/env bash

curl -X DELETE http://{{ groups["elasticsearch"][0] }}:9200/articles
curl -X DELETE http://{{ groups["elasticsearch"][0] }}:9200/companies
curl -X DELETE http://{{ groups["elasticsearch"][0] }}:9200/tags
curl -X DELETE http://{{ groups["elasticsearch"][0] }}:9200/features
curl -X DELETE http://{{ groups["elasticsearch"][0] }}:9200/series
