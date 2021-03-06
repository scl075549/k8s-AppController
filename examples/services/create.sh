#!/bin/bash

source ../common.sh

set -x

$KUBECTL_NAME create -f ../../manifests/appcontroller.yaml
wait-appcontroller

$KUBECTL_NAME create -f deps.yaml

cat job.yaml | $KUBECTL_NAME exec -i k8s-appcontroller kubeac wrap | $KUBECTL_NAME create -f -

cat service.yaml | $KUBECTL_NAME exec -i k8s-appcontroller kubeac wrap | $KUBECTL_NAME create -f -
cat pod.yaml | $KUBECTL_NAME exec -i k8s-appcontroller kubeac wrap | $KUBECTL_NAME create -f -
cat pod2.yaml | $KUBECTL_NAME exec -i k8s-appcontroller kubeac wrap | $KUBECTL_NAME create -f -
cat pod3.yaml | $KUBECTL_NAME exec -i k8s-appcontroller kubeac wrap | $KUBECTL_NAME create -f -
cat pod4.yaml | $KUBECTL_NAME exec -i k8s-appcontroller kubeac wrap | $KUBECTL_NAME create -f -

$KUBECTL_NAME create -f ../../manifests/appcontroller.yaml
$KUBECTL_NAME logs -f k8s-appcontroller
