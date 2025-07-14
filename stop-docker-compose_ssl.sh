#!/bin/bash

# bizbase 경로 설정
gwbase="$(pwd)/config"
bizbase="$(pwd)"

# 환경 변수 설정
export sql="$bizbase/sql/schema.sql"
export keymanagerlog="$bizbase/logs"

# GW config
export accesslog="$keymanagerlog/accesslog.log"
export gwconfig="$gwbase/envoy_ssl.yaml"
export servercrt="$gwbase/certs/server.crt"
export serverkey="$gwbase/certs/server.key"
export serverca="$gwbase/certs/ca.crt"

# 설정된 환경 변수 확인
echo "Access Log Path: $accesslog"
echo "Key Manager Log Path: $keymanagerlog"
echo "GW Config Path: $gwconfig"
echo "Server CRT Path: $servercrt"
echo "Server KEY Path: $serverkey"
echo "Server CA Path: $serverca"

# Docker Compose 파일 경로 설정
dockerComposeFile="$bizbase/docker-compose_ssl.yml"

# Docker Compose로 컨테이너 종료
sudo -E docker compose -f "$dockerComposeFile" down