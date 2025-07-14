
$gwbase = "$(pwd)/config"
$bizbase = "$(pwd)"

# 환경 변수 설정
$env:sql = "$bizbase/sql/schema.sql"
$env:keymanagerlog = "$bizbase/logs"

#gw config
$env:accesslog = "$bizbase/logs/accesslog.log"
$env:gwconfig = "$gwbase/envoy.yaml"
$env:servercrt = "$gwbase/certs/server.crt"
$env:serverkey = "$gwbase/certs/server.key"
$env:serverca = "$gwbase/certs/ca.crt"

# 설정된 환경 변수 확인
Write-Host "Access Log Path: $env:accesslog"
Write-Host "Key Manager Log Path: $env:keymanagerlog"
Write-Host "GW Config Path: $env:gwconfig"
Write-Host "Server CRT Path: $env:servercrt"
Write-Host "Server KEY Path: $env:serverkey"
Write-Host "Server CA Path: $env:serverca" 


$dockerComposeFile="$bizbase/docker-compose.yml"

# docker-compose 실행
# docker-compose up -d
docker-compose -f $dockerComposeFile up -d
