# Security Service API Document 

## 목차

1. `/api/rtrvKeys`: 키 요청
2. `/api/getAllKeys`: 전체 키 리스트 조회
3. `/api/evalKey`: 키 평가
4. `http error code` : HTTP 에러 코드

##  Field Description

### API /api/rtrvKeys

#### **요청**

- **Method**: `POST`
- **Request Body**: JSON
- **설명**: 키 요청을 처리하며, 성공 또는 실패 여부를 반환합니다.
    - 성공 시: HTTP 상태 코드 200 및 결과 `result: success`
    - 실패 시: HTTP 상태 코드 500 및 결과 `result: fail`
    - x-check-header 파싱 실패 시: HTTP 상태 코드 400 및 결과 `result: fail`

- request header
```bash 
Content-Type: application/json
x-check-header: A1B2C3D4E5F6ABCD123456789012345678HX20001234202301011234561234567890ABCDEF1234567890ABCDEF1234567890ABCDEF1234567890ABCDEF12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890
x-forwarded-by: Gateway

```

- request body 
- requestid:
    - 역할: 요청을 고유하게 식별하기 위한 ID입니다.
    - 형식:
        - UUID(Universally Unique Identifier : 전 세계에서 고유성을 보장하는 식별자) 기반의 32자리 문자열.
        - 하이픈(-) 없이 연속된 문자열로 제공되어야 합니다.

``` json
{
   "requestid": "111111111111111111111111111"
}
```

#### **응답**

- **Headers**: 파싱된 요청 헤더 정보 반환
- **output** : aes256 key 정보 리턴 noneDefList 와 defaultKeyList 정보 리턴
    - **contents**:
        - `noneDefList`: 기본값이 아닌 키 정보
        - `defaultKeyList`: 기본값 키 정보

``` json

{
    "result": "success",
    "headers": {
        "serial_number": "ABCD123456789012345678",
        "time_stamp": "20230101123456",
        "auth_key": "1234567890ABCDEF1234567890ABCDEF1234567890ABCDEF1234567890ABCDEF",
        "valid_models": [
            ""
        ],
        "random_number": "12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234",
        "mac_address": "A1B2C3D4E5F6",
        "model_name": "HX20001234"
    },
    "contents": {
        "noneDefList": [
            {
                "SCRN_NM": "Screen_6",
                "MAJOR_VER": 0,
                "RTRV_CNT": 2,
                "EQUIP_MDL_CD": "HMDL0001",
                "ROW_NUM": 2,
                "IV_VAL": "ivkegen12345",
                "MINOR_VER": 1,
                "ENC_VAL_CTT": "claWifC8bh6WvxZclSDqCvmzvZDUoZoi",
                "SRCEQUIP_MDL_CD": "HX20001234",
                "SCRN_ID": 6,
                "COL_NUM": 7,
                "DEFAULT_YN": "N"
            },
            {
                "SCRN_NM": "Screen_6",
                "MAJOR_VER": 0,
                "RTRV_CNT": 2,
                "EQUIP_MDL_CD": "HMDL0001",
                "ROW_NUM": 1,
                "IV_VAL": "ivkegen12345",
                "MINOR_VER": 1,
                "ENC_VAL_CTT": "v0mrneTxgsqO5FHoUsov8XYEGcqpZuAp",
                "SRCEQUIP_MDL_CD": "HX20001234",
                "SCRN_ID": 6,
                "COL_NUM": 8,
                "DEFAULT_YN": "N"
            }
        ],
        "defaultKeyList": [
            {
                "SCRN_NM": "Screen_6",
                "MAJOR_VER": 0,
                "RTRV_CNT": 2,
                "EQUIP_MDL_CD": "HMDL0001",
                "ROW_NUM": 15,
                "IV_VAL": "ivkegen12345",
                "MINOR_VER": 1,
                "ENC_VAL_CTT": "gAwTDJNheqcpzT4J4b3EpOnwlRq0yP6g",
                "SRCEQUIP_MDL_CD": "HX20001234",
                "SCRN_ID": 6,
                "COL_NUM": 15,
                "DEFAULT_YN": "Y"
            }
        ]
    }
}


```

### API /api/getAllKeys

#### **요청**

- **Method**: `POST`
- **Request Body**: JSON
- **설명**: 전체 키 리스트를 조회합니다.
    - 성공 시: HTTP 상태 코드 200 및 결과 `result: success`
    - 실패 시: HTTP 상태 코드 500 및 결과 `result: fail`  

- request header
```bash
Content-Type: application/json
x-check-header: A1B2C3D4E5F6ABCD123456789012345678HX20001234202301011234561234567890ABCDEF1234567890ABCDEF1234567890ABCDEF1234567890ABCDEF12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890
x-forwarded-by: Gateway

```

- request body
- 필수 필드:
    - `requestid`: 요청 ID (`uuid` 형식, 하이픈 없음)

``` json
{
    "requestid": "111111111111111111111111111"
}
```

#### **응답**

- **contents**:
    - `output`: 각 키 정보 (major, minor, row, col 조합별 키 정보 리턴)

``` json

{
    "output": {
        "0-1-7-7": "lv5hfNbSwaJiYhvPjwaen3CzdQTVyufU",
        "0-1-7-8": "hvw0CvcxPDGaDH5Wga2sFbpyvkpZQn7z",
        "0-1-7-9": "uxrKXpptd4sZQCoHOlQYBanaJlE1VRic",
        "0-1-7-3": "OP2YdWU7OyvUIZg8bDtxftk98959KFu8",
        "0-1-7-4": "YS2Kn3MP89e3BPKGznDDts9gFG8Q6xKL",
        "0-1-7-5": "C3SIB8SrwTbTIOqpCa3ImjzTUioIuoRb",
        "0-1-7-6": "FWIkX5jyMhPZKerEQkvEiuf927OY7MUc",
        ....
    }
}

```
### API /api/evalKey

#### **요청**

- **Method**: `POST`
- **Request Body**: JSON
- **설명**: 주어진 평가 값(`evalvalue`)에 대해 키 검증을 수행합니다.
    - 성공 시: HTTP 상태 코드 200 및 결과 `result: success`
    - 실패 시: HTTP 상태 코드 500 및 결과 `result: fail`


- request header
```bash
Content-Type: application/json
x-check-header: A1B2C3D4E5F6ABCD123456789012345678HX20001234202301011234561234567890ABCDEF1234567890ABCDEF1234567890ABCDEF1234567890ABCDEF12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890
x-forwarded-by: Gateway

```

- request body
- 필수 필드:
    - `requestid`: 요청 ID (`uuid` 형식, 하이픈 없음)
    - `params`:
        - `major`: 메이저 버전
        - `minor`: 마이너 버전
        - `row`: 행
        - `col`: 열
        - `evalvalue`: 평가할 키 값

``` json

{
    "params": {
        "major": "0",
        "minor": "1",
        "row": "0",
        "col": "0",
        "evalvalue": "sdasddddddddddddddddddddddddddddddddddddddddddddddddd"
    },
    "requestid": "111111111111111111111111111"
}

```

#### **응답**

- **output**:
    - `decodeData`: 평가 값 그대로 반환
    - `encodeData`: `evalvalue`를 AES256으로 암호화한 값 (HEX String으로 변환)
``` json

{
    "output": {
        "decodeData": "sdasddddddddddddddddddddddddddddddddddddddddddddddddd",
        "encodeData": "0887EF947593F369C0BEAA797B7C03367F6ED7F17F050E9A49991C9FB2B146C1280C1E4A74D34DE7EB188D7D4D03BCF39DC6E566BE7C4AD32D69AB72576641A78D12D8FC3E9BBD19AD10C518D49AE1AE25"
    }
}

```


### Curl Example

- req
- /api/rtrvKeys
``` bash
curl --location 'https://127.0.0.1:33333/api/rtrvKeys' \
--header 'x-check-header: A1B2C3D4E5F6ABCD123456789012345678HX20001234202301011234561234567890ABCDEF1234567890ABCDEF1234567890ABCDEF1234567890ABCDEF12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890' \
--header 'Content-Type: application/json' \
--data '{}'
```

- res

``` json
{
    "result": "success",
    "headers": {
        "serial_number": "ABCD123456789012345678",
        "time_stamp": "20230101123456",
        "mac_address": "A1B2C3D4E5F6",
        "model_name": "HX20001234",
        "auth_key": "1234567890ABCDEF1234567890ABCDEF1234567890ABCDEF1234567890ABCDEF",
        "random_number": "12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234",
        "valid_models": [
            ""
        ]
    },
    "contents": {
        "noneDefList": [
            {
                "SCRN_NM": "Screen_6",
                "MAJOR_VER": 0,
                "RTRV_CNT": 2,
                "EQUIP_MDL_CD": "HMDL0001",
                "ROW_NUM": 2,
                "IV_VAL": "ivkegen12345",
                "MINOR_VER": 1,
                "ENC_VAL_CTT": "4uRcGxMG5Tx3qt2MGeAOo1MdW0YiVdNo",
                "SRCEQUIP_MDL_CD": "HX20001234",
                "SCRN_ID": 6,
                "COL_NUM": 8,
                "DEFAULT_YN": "N"
            },
            {
                "SCRN_NM": "Screen_6",
                "MAJOR_VER": 0,
                "RTRV_CNT": 2,
                "EQUIP_MDL_CD": "HMDL0001",
                "ROW_NUM": 7,
                "IV_VAL": "ivkegen12345",
                "MINOR_VER": 1,
                "ENC_VAL_CTT": "OP2YdWU7OyvUIZg8bDtxftk98959KFu8",
                "SRCEQUIP_MDL_CD": "HX20001234",
                "SCRN_ID": 6,
                "COL_NUM": 3,
                "DEFAULT_YN": "N"
            }
        ],
        "defaultKeyList": [
            {
                "SCRN_NM": "Screen_6",
                "MAJOR_VER": 0,
                "RTRV_CNT": 2,
                "EQUIP_MDL_CD": "HMDL0001",
                "ROW_NUM": 15,
                "IV_VAL": "ivkegen12345",
                "MINOR_VER": 1,
                "ENC_VAL_CTT": "gAwTDJNheqcpzT4J4b3EpOnwlRq0yP6g",
                "SRCEQUIP_MDL_CD": "HX20001234",
                "SCRN_ID": 6,
                "COL_NUM": 15,
                "DEFAULT_YN": "Y"
            }
        ]
    }
}

```

- req
- /api/getAllKeys

``` bash
curl --location 'https://127.0.0.1:33333/api/getAllKeys' \
--header 'x-check-header: A1B2C3D4E5F6ABCD123456789012345678HX20001234202301011234561234567890ABCDEF1234567890ABCDEF1234567890ABCDEF1234567890ABCDEF12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890' \
--header 'Content-Type: application/json' \
--data '{
    "requestid": "111111111111111111111111111"
}'

```

- res

``` json

{
    "contentMap": {
        "0-1-7-7": "lv5hfNbSwaJiYhvPjwaen3CzdQTVyufU",
        "0-1-7-8": "hvw0CvcxPDGaDH5Wga2sFbpyvkpZQn7z",
        "0-1-7-9": "uxrKXpptd4sZQCoHOlQYBanaJlE1VRic",
        "0-1-7-3": "OP2YdWU7OyvUIZg8bDtxftk98959KFu8",
        "0-1-7-4": "YS2Kn3MP89e3BPKGznDDts9gFG8Q6xKL",
        "0-1-7-5": "C3SIB8SrwTbTIOqpCa3ImjzTUioIuoRb",
        "0-1-7-6": "FWIkX5jyMhPZKerEQkvEiuf927OY7MUc",
        "0-1-7-0": "eo5sKWGD1kkoGs26zUVqjeNwjmLewU9s",
        "0-1-7-1": "VEo0IoAZPGNFoHMI5mVwKtp9WnO77SZX",
        "0-1-7-2": "hZbZeyrDLjsjRyUqm8ri8yz6Ogsidg2H",
        "0-1-15-11": "tRpH9uLo75OR7indLtOCjHXLIwyjs4yT",
        "0-1-15-12": "ko0B2E6emD9VrSO7gt9J51n7sY9gVWe0",
        "0-1-15-13": "MkVdtGs9zOuo6IKlpdmWw0IWIMSpE37s",
        ....
    }
}


```


- req
- /api/evalKey

``` bash

curl --location 'https://127.0.0.1:33333/api/evalKey' \
--header 'x-check-header: A1B2C3D4E5F6ABCD123456789012345678HX20001234202301011234561234567890ABCDEF1234567890ABCDEF1234567890ABCDEF1234567890ABCDEF12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890' \
--header 'Content-Type: application/json' \
--data '{
    "params": {
        "major": "0",
        "minor": "1",
        "row": "0",
        "col": "0",
        "evalvalue": "sdasddddddddddddddddddddddddddddddddddddddddddddddddd"
    }
}'

```

- res

``` json

{
    "output": {
        "decodeData": "sdasddddddddddddddddddddddddddddddddddddddddddddddddd",
        "encodeData": "1F690D4714DA1335D8CDEB2B3E34AD210A701CC99BF480882852E64DBD04C1589C48BBD0231DACCE72F28305D1E7BD71454E3287ED926A9EDF6CBBE946F1C81677AB0D9866B150E63920DBDA16226106A2"
    }
}

```

### **추가 설명**

1. **헤더 구조**:
    - `/api/rtrvKeys` 요청 헤더에는 인증 및 요청자를 구분하기 위한 정보가 포함됩니다.
    - `x-check-header`와 같은 긴 인증 헤더를 통해 요청의 신뢰성을 검증합니다.
2. **UUID 기반 요청 ID**:
    - 대부분의 요청에서 `requestid` 필드는 필수이며, 하이픈이 없는 UUID 형식으로 제공되어야 합니다.
3. **AES256 암호화**:
    - `/api/evalKey`에서 키 값을 검증하거나 암호화된 데이터를 생성하기 위해 AES256 암호화를 사용합니다.
4. **키 리스트 구조**:
    - `noneDefList`와 `defaultKeyList`를 통해 기본값 여부에 따라 키 정보를 분리하여 반환합니다.
5. **오류 처리**:
    - 성공 시 항상 HTTP 상태 코드 200과 `result: success` 반환
    - 실패 시 HTTP 상태 코드 500과 `result: fail` 반환.

### http error code
```yml
HTTP 오류 코드
1xx (정보 응답)
    100 Continue: 클라이언트는 요청을 계속해야 함을 의미합니다.
    101 Switching Protocols: 서버가 클라이언트의 프로토콜 전환 요청을 수락했음을 나타냅니다.
2xx (성공)
    200 OK: 요청이 성공적으로 처리되었습니다.
    201 Created: 요청이 성공적으로 이루어지고 새로운 리소스가 생성되었습니다.
    202 Accepted: 요청이 수락되었으나 처리는 완료되지 않았습니다.
    204 No Content: 요청은 성공했으나, 클라이언트에 보낼 새로운 정보가 없습니다.
3xx (리다이렉션)
    301 Moved Permanently: 요청한 리소스가 영구적으로 새 위치로 이동되었습니다.
    302 Found: 요청한 리소스가 일시적으로 다른 위치로 이동했습니다.
    304 Not Modified: 조건부 GET 요청의 조건이 만족되지 않았을 때 전송됩니다.
4xx (클라이언트 오류)
    400 Bad Request: 서버가 요청을 이해할 수 없습니다.
    401 Unauthorized: 인증이 필요한 페이지를 요청한 경우입니다.
    403 Forbidden: 서버가 요청을 거부하고 있습니다.(gw 와 biz service 간 요청정보가 맞지 않은경우)
    404 Not Found: 요청한 리소스를 서버에서 찾을 수 없습니다.
    405 Method Not Allowed: 요청된 메소드는 허용되지 않습니다.
    408 Request Timeout: 클라이언트의 요청이 지정된 시간 내에 완료되지 않았습니다.
    429 Too Many Requests: 너무 많은 요청이 짧은 시간 내에 이루어졌습니다.
5xx (서버 오류)
    500 Internal Server Error: 서버 내부에서 오류가 발생했습니다.(controller 오류시)
    501 Not Implemented: 서버가 요청 메소드를 지원하거나 인식할 수 없습니다.
    502 Bad Gateway: 서버가 게이트웨이 또는 프록시로부터 잘못된 응답을 받았습니다.
    503 Service Unavailable: 서버가 일시적으로 요청을 처리할 준비가 되어 있지 않습니다. 주로 유지보수 또는 오버로드 때문입니다.
    504 Gateway Timeout: 게이트웨이가 시간 내에 응답하지 않습니다
```