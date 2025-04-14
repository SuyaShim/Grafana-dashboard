#!/bin/bash

create_dashboard_cm() {
  local file=$1
  local name=$2
  local ns=$3
  
  # ConfigMap 생성
  kubectl create configmap $name \
    --from-file=$file \
    --namespace=$ns
    
  # 라벨 추가
  kubectl label configmap $name \
    grafana_dashboard="1" \
    --namespace=$ns
}

NAMESPACE="prometheus" 

create_dashboard_cm \
  "Blackbox-exporter.json" \
  "blackbox-exporter-dashboard" \
  "$NAMESPACE"

create_dashboard_cm \
  "MSK.json" \
  "msk-dashboard" \
  "$NAMESPACE"
