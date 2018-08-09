cat esinit.sh
#!/usr/bin/env bash

cd `dirname $0`
../elasticsearch/articles/init.sh
../elasticsearch/companies/init.sh
../elasticsearch/tags/init.sh
../elasticsearch/features/init.sh
../elasticsearch/series/init.sh

