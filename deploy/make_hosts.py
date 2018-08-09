#!/usr/bin/env python3

import sys,os
import argparse
import googleapiclient.discovery
from oauth2client.service_account import ServiceAccountCredentials
import yaml

credentials = ServiceAccountCredentials.from_json_keyfile_name("/root/.gcp/infra-ro-credential.json")

# GET INSTANCES

def list_instances(project , zone):
    compute = googleapiclient.discovery.build('compute', 'v1', credentials=credentials)
    result = compute.instances().list(project=project, zone=zone).execute()
    return result['items']


def main():
    result = list_instances(argvs[1],argvs[2])
    data = {}
    for i in result:
      hostgroup = i["labels"]["hostgroup"]
      hostname  = i["name"]
      
      if data.get(hostgroup) is None :
         data[hostgroup] = [hostname]

      else:
         data[hostgroup].append(hostname)

    text = []
    for gn in data.keys() :
        text.append('[{}]'.format(gn))
        for host in data[gn]:
            text.append(host)

    print ('\n'.join(text))
    f = open("hosts", "w")     
    f.write('\n'.join(text))
    f.close()

if __name__ == '__main__':
    argvs = sys.argv
    main()
