
## 개요
- Key 를 관리하는 Table을 설명합니다.

## 목차 
    1. TABLE LIST
    2. Key 설계

### TABLE LIST

- Key 를 관리하는 Table 목록

| No | Table Name | Description | 비고 |
| --- | --- | --- | --- |
| 1 | SEC_METRIC_INFO | 암호화 값을 관리하는 Table |
| 2 | SEC_SCREEN_INFO | 스크린 정보를 관리하는 Table |
| 3 | SCRN_MDL_INFO | 스크린 정보와 모델 정보를 Mapping 하는 Table |


- sample data 
    1. ./sql/sec_metric_info_inserts.sql
    2. ./sql/sec_screen_info_inserts.sql
    3. ./sql/scrn_mdl_info_inserts.sql

### Key 설계

- aec  key 설계
	1. 4byte info 

| No  | Byte 위치 | 범위        | 의미                 | 범례  |
| --- | ------- | --------- | ------------------ | --- |
| 1   | 0       | 0~255     | Major version      |     |
| 2   | 1       | 0~255     | Minor version      |     |
| 3   | 2       | 0x00~0x15 | aes key row metrix |     |
| 4   | 3       | 0x00~0x15 | aes key col metrix |     |
- sample

``` bash

0x000x000x000x00 => version = 0.0 row = 0, col = 0

```

- aeskey schema 

-  asc key data info
 1. AEC KEY 정보를 Metric 형태로 보관하는 기본 Table

| NO  | 논리명    | 물리명         | TYPE     | LENGTH | PK  | NN  | default | 비고                |
| --- | ------ | ----------- | -------- | ------ | --- | --- | ------- | ----------------- |
| 1   | 매이저 버전 | MAJOR_VER   | NUMBER   | 3      | Y   | Y   | 0       | 0-255             |
| 2   | 마이너 버전 | MINOR_VER   | NUMBER   | 3      | Y   | Y   | 0       | 0-255             |
| 3   | 행넘버    | ROW_NUM     | NUMBER   | 2      | Y   | Y   |         | 0-15             |
| 4   | 열번호    | COL_NUM     | NUMBER   | 2      | Y   | Y   |         | 0-15             |
| 5   | 작성자    | AUDIT_ID    | VARCHAR2 | 50     |     | Y   |         |                   |
| 6   | 작성일자   | AUDIT_DTM   | DATE     |        |     | Y   | sysdate |                   |
| 7   | 암호화값   | ENC_VAL_CTT | VARCHAR2 | 256    |     | Y   |         | aes256 ascii data |
| 8   | 모델ID    | EQUIP_MDL_ID | VARCHAR2 | 100    |     | Y   |         |                   |
| 9   | IV값       | IV_VAL   | VARCHAR2 | 256    |     | Y   |         |                   |
| 10  | 부가정보   | ADD_TXT_VAL | VARCHAR2 | 1000   |     |     |         |                   |


- h2 ddl

``` sql 
CREATE TABLE SEC_METRIC_INFO (
    MAJOR_VER   INT       NOT NULL DEFAULT 0,          -- 매이저 버전
    MINOR_VER   INT       NOT NULL DEFAULT 0,          -- 마이너 버전
    ROW_NUM     INT       NOT NULL,                    -- 행넘버
    COL_NUM     INT       NOT NULL,                    -- 열번호
    AUDIT_ID    VARCHAR(50) NOT NULL,                 -- 작성자
    AUDIT_DTM   TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,  -- 작성일자
    ENC_VAL_CTT VARCHAR2(256) NOT NULL,                -- 암호화값
    IV_VAL      VARCHAR2(256) NOT NULL,                -- IV값
    ADD_TXT_VAL VARCHAR2(1000),                        -- 부가정보
    PRIMARY KEY (MAJOR_VER, MINOR_VER, ROW_NUM, COL_NUM)
);
```

- oracle ddl
``` sql 

CREATE TABLE SEC_METRIC_INFO (
    MAJOR_VER   NUMBER(3)       NOT NULL DEFAULT 0,         -- 매이저 버전
    MINOR_VER   NUMBER(3)       NOT NULL DEFAULT 0,         -- 마이너 버전
    ROW_NUM     NUMBER(2)       NOT NULL,                   -- 행넘버
    COL_NUM     NUMBER(2)       NOT NULL,                   -- 열번호
    AUDIT_ID    VARCHAR2(50)    NOT NULL,                   -- 작성자
    AUDIT_DTM   DATE            NOT NULL DEFAULT SYSDATE,   -- 작성일자
    ENC_VAL_CTT VARCHAR2(256)   NOT NULL,                   -- 암호화값
    IV_VAL      VARCHAR2(256)   NOT NULL,                   -- IV값
    ADD_TXT_VAL VARCHAR2(1000),                             -- 부가정보
    PRIMARY KEY (MAJOR_VER, MINOR_VER, ROW_NUM, COL_NUM)
);

```

- h2 sample data 

``` sql
INSERT INTO SEC_METRIC_INFO (MAJOR_VER, MINOR_VER, ROW_NUM, COL_NUM, AUDIT_ID, AUDIT_DTM, ENC_VAL_CTT) VALUES (1, 0, 1, 1, 'user1', CURRENT_TIMESTAMP, 'sample_encryption_value_1'), (1, 0, 1, 2, 'user2', CURRENT_TIMESTAMP, 'sample_encryption_value_2'), (1, 0, 2, 1, 'user3', CURRENT_TIMESTAMP, 'sample_encryption_value_3'), (1, 1, 1, 1, 'user4', CURRENT_TIMESTAMP, 'sample_encryption_value_4'), (1, 1, 1, 2, 'user5', CURRENT_TIMESTAMP, 'sample_encryption_value_5');

```

- oracle sample data 

``` sql 

INSERT INTO SEC_METRIC_INFO (MAJOR_VER, MINOR_VER, ROW_NUM, COL_NUM, AUDIT_ID, AUDIT_DTM, ENC_VAL_CTT)
VALUES 
(1, 0, 1, 1, 'user1', SYSDATE, 'sample_encryption_value_1');

INSERT INTO SEC_METRIC_INFO (MAJOR_VER, MINOR_VER, ROW_NUM, COL_NUM, AUDIT_ID, AUDIT_DTM, ENC_VAL_CTT)
VALUES 
(1, 0, 1, 2, 'user2', SYSDATE, 'sample_encryption_value_2');

INSERT INTO SEC_METRIC_INFO (MAJOR_VER, MINOR_VER, ROW_NUM, COL_NUM, AUDIT_ID, AUDIT_DTM, ENC_VAL_CTT)
VALUES 
(1, 0, 2, 1, 'user3', SYSDATE, 'sample_encryption_value_3');

INSERT INTO SEC_METRIC_INFO (MAJOR_VER, MINOR_VER, ROW_NUM, COL_NUM, AUDIT_ID, AUDIT_DTM, ENC_VAL_CTT)
VALUES 
(1, 1, 1, 1, 'user4', SYSDATE, 'sample_encryption_value_4');

INSERT INTO SEC_METRIC_INFO (MAJOR_VER, MINOR_VER, ROW_NUM, COL_NUM, AUDIT_ID, AUDIT_DTM, ENC_VAL_CTT)
VALUES 
(1, 1, 1, 2, 'user5', SYSDATE, 'sample_encryption_value_5');


```


- aes key screen info
1. AES KEY 의 행렬의 리스트를 가지고 있는 TABLE
2. 모든 스크린에는 ROW(15), COL(15)를 제공 해야 함 (ADAMS -> AP로 전송하는 기본 key)

| NO  | 논리명     | 물리명       | TYPE     | LENGTH | PK  | NN  | default | 비고  |
| --- | ------- | --------- | -------- | ------ | --- | --- | ------- | --- |
| 1   | 스크린ID   | SCRN_ID   | NUMBER   | 22     | Y   | Y   |         | seq |
| 2   | 매이저 버전  | MAJOR_VER | NUMBER   | 3      | Y   | Y   |         |     |
| 3   | 마이너 버전  | MINOR_VER | NUMBER   | 2      | Y   | Y   |         |     |
| 4   | 스크린 순서  | SCR_SEQ   | NUMBER   | 22     | Y   | Y   |         |     |
| 5   | 작성자     | AUDIT_ID  | VARCHAR2 | 50     |     | Y   |         |     |
| 6   | 작성일자    | AUDIT_DTM | DATE     |        |     | Y   | sysdate |     |
| 7   | 스크린명    | SCRN_NM   | VARCHAR2 | 100    |     | Y   |         |     |
| 8   | 스크린 ROW | SCRN_ROW  | NUMBER   | 2      |     | Y   |         |     |
| 9   | 스크린 COL | SCRN_COL  | NUMBER   | 2      |     | Y   |         |     |
| 10   | 기본 스크린 여부 | DEFAULT_YN  | CHAR    | 1     |     | Y   |   'N'     |     |

- h2 ddl 

``` sql 

-- 스크린 정보
CREATE TABLE SEC_SCREEN_INFO (
    SCRN_ID    BIGINT       NOT NULL,                 -- 스크린ID
    MAJOR_VER  INT          NOT NULL,                 -- 매이저 버전
    MINOR_VER  INT          NOT NULL,                 -- 마이너 버전
    SCR_SEQ    BIGINT       NOT NULL,                 -- 스크린 순서
    AUDIT_ID   VARCHAR(50)  NOT NULL,                 -- 작성자
    AUDIT_DTM  TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,  -- 작성일자
    SCRN_NM    VARCHAR(100) NOT NULL,                 -- 스크린명
    SCRN_ROW   INT          NOT NULL,                 -- 스크린 ROW
    SCRN_COL   INT          NOT NULL,                 -- 스크린 COL
	DEFAULT_YN	CHAR(1)		NOT NULL DEFAULT 'N',		-- 기본 스크린 여부
    PRIMARY KEY (SCRN_ID, MAJOR_VER, MINOR_VER, SCR_SEQ)
);

```

- oracle ddl 

```sql
CREATE TABLE SEC_SCREEN_INFO (
    SCRN_ID    NUMBER(22)    NOT NULL,                -- 스크린ID
    MAJOR_VER  NUMBER(3)     NOT NULL,                -- 매이저 버전
    MINOR_VER  NUMBER(2)     NOT NULL,                -- 마이너 버전
    SCR_SEQ    NUMBER(22)    NOT NULL,                -- 스크린 순서
    AUDIT_ID   VARCHAR2(50)  NOT NULL,                -- 작성자
    AUDIT_DTM  DATE          NOT NULL DEFAULT SYSDATE,  -- 작성일자
    SCRN_NM    VARCHAR2(100) NOT NULL,                -- 스크린명
    SCRN_ROW   NUMBER(2)     NOT NULL,                -- 스크린 ROW
    SCRN_COL   NUMBER(2)     NOT NULL,                -- 스크린 COL
    DEFAULT_YN	CHAR(1)		NOT NULL DEFAULT 'N',		-- 기본 스크린 여부
    PRIMARY KEY (SCRN_ID, MAJOR_VER, MINOR_VER, SCR_SEQ)
);

```

- h2 sample

``` sql

INSERT INTO SEC_SCREEN_INFO (SCRN_ID, MAJOR_VER, MINOR_VER, SCR_SEQ, AUDIT_ID, AUDIT_DTM, SCRN_NM, SCRN_ROW, SCRN_COL,DEFAULT_YN)
VALUES 
(1, 1, 0, 1, '사용자스크린', CURRENT_TIMESTAMP, 'Home Screen', 10, 10,'N'),
(1, 1, 0, 2, 'user1', CURRENT_TIMESTAMP, 'Home Screen', 10, 10,'N'),
(1, 1, 0, 3, 'user1', CURRENT_TIMESTAMP, 'Home Screen', 10, 10,'N'),
(1, 1, 0, 4, 'user2', CURRENT_TIMESTAMP, 'Settings Screen', 20, 20,'N'),

(3, 1, 1, 1, 'user3', CURRENT_TIMESTAMP, 'Profile Screen', 15, 15,'N'),
(4, 1, 1, 2, 'user4', CURRENT_TIMESTAMP, 'Help Screen', 25, 25,'N'),
(5, 2, 0, 1, 'user5', CURRENT_TIMESTAMP, 'About Screen', 30, 30,'Y');

```

- oracle sample 

``` sql 
INSERT INTO SEC_SCREEN_INFO (SCRN_ID, MAJOR_VER, MINOR_VER, SCR_SEQ, AUDIT_ID, AUDIT_DTM, SCRN_NM, SCRN_ROW, SCRN_COL,DEFAULT_YN)
VALUES 
(1, 1, 0, 1, 'user1', SYSDATE, 'Home Screen', 10, 10,'N');

INSERT INTO SEC_SCREEN_INFO (SCRN_ID, MAJOR_VER, MINOR_VER, SCR_SEQ, AUDIT_ID, AUDIT_DTM, SCRN_NM, SCRN_ROW, SCRN_COL,DEFAULT_YN)
VALUES 
(2, 1, 0, 2, 'user2', SYSDATE, 'Settings Screen', 20, 20,'N');

INSERT INTO SEC_SCREEN_INFO (SCRN_ID, MAJOR_VER, MINOR_VER, SCR_SEQ, AUDIT_ID, AUDIT_DTM, SCRN_NM, SCRN_ROW, SCRN_COL,DEFAULT_YN)
VALUES 
(3, 1, 1, 1, 'user3', SYSDATE, 'Profile Screen', 15, 15,'N');

INSERT INTO SEC_SCREEN_INFO (SCRN_ID, MAJOR_VER, MINOR_VER, SCR_SEQ, AUDIT_ID, AUDIT_DTM, SCRN_NM, SCRN_ROW, SCRN_COL,DEFAULT_YN)
VALUES 
(4, 1, 1, 2, 'user4', SYSDATE, 'Help Screen', 25, 25,'N');

INSERT INTO SEC_SCREEN_INFO (SCRN_ID, MAJOR_VER, MINOR_VER, SCR_SEQ, AUDIT_ID, AUDIT_DTM, SCRN_NM, SCRN_ROW, SCRN_COL,DEFAULT_YN)
VALUES 
(5, 2, 0, 1, 'user5', SYSDATE, 'About Screen', 30, 30,'Y');

```

- screen map info
1. 스크린 정보와 모델 정보를 Mapping 하는 Table.
2. default screen 을 제공 해야함. 

| NO  | 논리명   | 물리명          | TYPE     | LENGTH | PK  | NN  | default | 비고  |
| --- | ----- | ------------ | -------- | ------ | --- | --- | ------- | --- |
| 1   | 모델코드  | EQUIP_MDL_CD | VARCHAR2 | 100    | Y   | Y   |         |     |
| 2   | 소스 모델 코드  | SRCEQUIP_MDL_CD | VARCHAR2 | 100    | Y   | Y   |         |     |
| 3   | 작성자   | AUDIT_ID     | VARCHAR2 | 50     |     | Y   |         |     |
| 4   | 작성일자  | AUDIT_DTM    | DATE     |        |     | Y   | sysdate |     |
| 5   | 스크린ID | SCRN_ID      | NUMBER   | 22     |     | Y   |         |     |
| 6   | 만료일자  | EXPIRE_DT    | VARCHAR2 | 8      |     | Y   |         |     |
| 7   | 조회결과수  | RTRV_CNT    | BIGINT | 8      |     | Y   |      2   |     |
| 8   | 부가정보  | ADD_TXT_VAL  | VARCHAR2 | 1000   |     |     |         |     |

- h2 ddl

``` sql 

CREATE TABLE SCRN_MDL_INFO (
    EQUIP_MDL_CD   VARCHAR(100)  NOT NULL,                -- 모델 코드
    SRCEQUIP_MDL_CD VARCHAR(100),                         -- 소스 모델 코드
    AUDIT_ID       VARCHAR(50)   NOT NULL,                -- 작성자
    AUDIT_DTM      TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,  -- 작성일자
    SCRN_ID        BIGINT        NOT NULL,                -- 스크린ID
    EXPIRE_DT      VARCHAR(8)    NOT NULL,                -- 만료일자
    RTRV_CNT       BIGINT        NOT NULL DEFAULT 2,      -- 조회결과수
    ADD_TXT_VAL    VARCHAR(1000),                         -- 부가정보
    PRIMARY KEY (EQUIP_MDL_CD)
);

```

- sample
``` sql 

INSERT INTO YOUR_TABLE_NAME (EQUIP_MDL_CD, SRCEQUIP_MDL_CD, AUDIT_ID, AUDIT_DTM, SCRN_ID, EXPIRE_DT, RTRV_CNT, ADD_TXT_VAL)
VALUES 
('M001', 'M001', 'user1', CURRENT_TIMESTAMP, 1001, '20231231',2,'Additional Information 1'),
('M002', 'M002', 'user2', CURRENT_TIMESTAMP, 1002, '20241231',2,'Additional Information 2'),
('M003', 'M003', 'user3', CURRENT_TIMESTAMP, 1003, '20251231',2, 'Additional Information 3'),
('M004', 'M004', 'user4', CURRENT_TIMESTAMP, 1004, '20261231',2, 'Additional Information 4'),
('M005', 'M005', 'user5', CURRENT_TIMESTAMP, 1005, '20271231',2, 'Additional Information 5');


```

- oracle ddl

``` sql 

CREATE TABLE SCRN_MDL_INFO (
    EQUIP_MDL_CD VARCHAR2(100)  NOT NULL,               -- 모델코드
    SRCEQUIP_MDL_CD VARCHAR(100),                         -- 소스 모델 코드
    AUDIT_ID     VARCHAR2(50)   NOT NULL,               -- 작성자
    AUDIT_DTM    DATE           NOT NULL DEFAULT SYSDATE,  -- 작성일자
    SCRN_ID      NUMBER(22)     NOT NULL,               -- 스크린ID
    EXPIRE_DT    VARCHAR2(8)    NOT NULL,               -- 만료일자
    RTRV_CNT     BIGINT         NOT NULL DEFAULT 2,     -- 조회결과수
    ADD_TXT_VAL  VARCHAR2(1000),                        -- 부가정보
    PRIMARY KEY (EQUIP_MDL_ID)
);

```

- sample
``` sql

INSERT INTO YOUR_TABLE_NAME (EQUIP_MDL_CD, SRCEQUIP_MDL_CD, AUDIT_ID, AUDIT_DTM, SCRN_ID, EXPIRE_DT, RTRV_CNT, ADD_TXT_VAL)
VALUES 
('M001', 'M001', 'user1', SYSDATE, 1001, '20231231', 2, 'Additional Information 1');

INSERT INTO YOUR_TABLE_NAME (EQUIP_MDL_CD, SRCEQUIP_MDL_CD, AUDIT_ID, AUDIT_DTM, SCRN_ID, EXPIRE_DT, RTRV_CNT, ADD_TXT_VAL)
VALUES 
('M002', 'M002', 'user2', SYSDATE, 1002, '20241231', 2, 'Additional Information 2');

INSERT INTO YOUR_TABLE_NAME (EQUIP_MDL_CD, SRCEQUIP_MDL_CD, AUDIT_ID, AUDIT_DTM, SCRN_ID, EXPIRE_DT, RTRV_CNT, ADD_TXT_VAL)
VALUES 
('M003', 'M003', 'user3', SYSDATE, 1003, '20251231', 2, 'Additional Information 3');

INSERT INTO YOUR_TABLE_NAME (EQUIP_MDL_CD, SRCEQUIP_MDL_CD, AUDIT_ID, AUDIT_DTM, SCRN_ID, EXPIRE_DT, RTRV_CNT, ADD_TXT_VAL)
VALUES 
('M004', 'M004', 'user4', SYSDATE, 1004, '20261231', 2, 'Additional Information 4');

INSERT INTO YOUR_TABLE_NAME (EQUIP_MDL_CD, SRCEQUIP_MDL_CD, AUDIT_ID, AUDIT_DTM, SCRN_ID, EXPIRE_DT, RTRV_CNT, ADD_TXT_VAL)
VALUES 
('M005', 'M005', 'user5', SYSDATE, 1005, '20271231', 2, 'Additional Information 5');

```
- defaultTable

| 구분   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 | 0x08 | 0x09 | 0x10 | 0x11 | 0x12 | 0x13 | 0x14 | 0x15 |
| ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
| 0x00 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x01 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x02 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x03 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x04 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x05 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x06 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x07 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x08 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x09 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x10 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x11 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x12 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x13 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x14 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x15 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |

- screen (screen 1)

| 구분   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 | 0x08 | 0x09 | 0x10 | 0x11 | 0x12 | 0x13 | 0x14 | 0x15 |
| ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
| 0x00 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x01 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x02 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x03 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x04 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x05 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x06 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x07 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x08 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x09 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x10 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x11 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x12 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x13 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x14 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x15 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |

- screen (screen 2)

| 구분   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 | 0x08 | 0x09 | 0x10 | 0x11 | 0x12 | 0x13 | 0x14 | 0x15 |
| ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
| 0x00 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x01 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x02 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x03 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x04 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x05 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x06 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x07 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x08 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x09 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x10 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x11 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x12 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x13 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x14 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x15 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |

- screen (screen 3)

| 구분   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 | 0x08 | 0x09 | 0x10 | 0x11 | 0x12 | 0x13 | 0x14 | 0x15 |
| ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
| 0x00 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x01 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x02 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x03 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x04 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x05 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x06 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x07 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x08 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x09 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x10 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x11 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x12 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x13 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x14 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x15 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |

- screen (screen 4)

| 구분   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 | 0x08 | 0x09 | 0x10 | 0x11 | 0x12 | 0x13 | 0x14 | 0x15 |
| ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
| 0x00 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x01 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x02 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x03 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x04 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x05 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x06 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x07 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x08 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x09 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x10 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x11 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x12 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x13 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x14 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x15 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |

- screen (screen 5)

| 구분   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 | 0x08 | 0x09 | 0x10 | 0x11 | 0x12 | 0x13 | 0x14 | 0x15 |
| ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
| 0x00 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x01 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x02 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x03 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x04 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x05 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x06 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x07 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x08 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x09 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x10 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x11 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x12 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x13 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x14 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
| 0x15 |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |      |
