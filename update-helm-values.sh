#!/usr/bin/env bash
set -e
IMAGE_WEB="$1"
IMAGE_PRODUCT="$2"
IMAGE_ORDER="$3"
CHART_VALUES='charts/bluegreen-app/values.yaml'

if [ -z "${IMAGE_WEB}" ] || [ -z "${IMAGE_PRODUCT}" ] || [ -z "${IMAGE_ORDER}" ]; then
  echo "Usage: $0 <image-web> <image-product> <image-order>"
  exit 2
fi

python3 - <<PY
import sys,yaml
f='''${CHART_VALUES}'''
with open(f) as fh:
    d=yaml.safe_load(f)
if 'app' not in d: d['app'] = {}
d['app']['imageWebGreen'] = '${IMAGE_WEB}'
d['app']['imageProductGreen'] = '${IMAGE_PRODUCT}'
d['app']['imageOrderGreen'] = '${IMAGE_ORDER}'
with open(f,'w') as fh:
    yaml.safe_dump(d,fh,default_flow_style=False)
print('Updated', f)
PY
