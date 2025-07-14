

-- 메트릭 정보
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

-- 스크린 모델 정보
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


-- 메트릭 정보 초기 데이터
INSERT INTO SEC_METRIC_INFO (MAJOR_VER,MINOR_VER,ROW_NUM,COL_NUM,AUDIT_ID,AUDIT_DTM,ENC_VAL_CTT,IV_VAL,ADD_TXT_VAL) VALUES
	 (0,1,0,0,'system','2024-12-07 19:10:51.085145','a3q0dxzOk0cmqI3xaYFwtS5a4jENAjID','ivkegen12345',''),
	 (0,1,0,1,'system','2024-12-07 19:10:51.0871','zztqcO5Ici8TwfmtCymT5XNjRZ5uzcDs','ivkegen12345',''),
	 (0,1,0,2,'system','2024-12-07 19:10:51.088075','k086oNsQ51tBon8YV7KohoUlEExDYTEi','ivkegen12345',''),
	 (0,1,0,3,'system','2024-12-07 19:10:51.088075','nbgOvUwh8wr3drNc6eyfzutLsISzdfSB','ivkegen12345',''),
	 (0,1,0,4,'system','2024-12-07 19:10:51.089051','OmUd0hXH4RGeFn0cb0sE6LuxkejiAHUZ','ivkegen12345',''),
	 (0,1,0,5,'system','2024-12-07 19:10:51.09003','l3c0pP1zzvIjpybzdgLJU2nXm66dftqV','ivkegen12345',''),
	 (0,1,0,6,'system','2024-12-07 19:10:51.091007','MSAQNBVkaj9LCBG7YehnQn3IPp5oMNn1','ivkegen12345',''),
	 (0,1,0,7,'system','2024-12-07 19:10:51.091007','q3gVwlbZ0HarDdb9oH4MDUdq4fawgoAq','ivkegen12345',''),
	 (0,1,0,8,'system','2024-12-07 19:10:51.091982','atbRhus5NKQw1YYaPXwQXHtsK9wnV7fg','ivkegen12345',''),
	 (0,1,0,9,'system','2024-12-07 19:10:51.092959','lcJsFTqLByOCVNCaPP2xZrocCzDSTpd1','ivkegen12345','');
INSERT INTO SEC_METRIC_INFO (MAJOR_VER,MINOR_VER,ROW_NUM,COL_NUM,AUDIT_ID,AUDIT_DTM,ENC_VAL_CTT,IV_VAL,ADD_TXT_VAL) VALUES
	 (0,1,0,10,'system','2024-12-07 19:10:51.093934','E6qlivBXbfpI8omCMDl8RSY1Jf9VTsUP','ivkegen12345',''),
	 (0,1,0,11,'system','2024-12-07 19:10:51.093934','kXcJXnoTFTz7Z68dEm5BveOVX2gumDUj','ivkegen12345',''),
	 (0,1,0,12,'system','2024-12-07 19:10:51.094911','jp9KW3qGniWPFZ2vVmLdjUpna7IFviEg','ivkegen12345',''),
	 (0,1,0,13,'system','2024-12-07 19:10:51.095889','MkvZneEPiHAevvEIm8Ghrx3w4bROaB6u','ivkegen12345',''),
	 (0,1,0,14,'system','2024-12-07 19:10:51.095889','qdPNtEJ74cO9drfv1vlmUR3rhWUANNpb','ivkegen12345',''),
	 (0,1,0,15,'system','2024-12-07 19:10:51.096865','CgDniX89lhsoAVRSkDR8PPxdrIkVKZpe','ivkegen12345',''),
	 (0,1,1,0,'system','2024-12-07 19:10:51.097841','kXTpdYpb6QOrw4qXxS3JtxlPu9qtBnqW','ivkegen12345',''),
	 (0,1,1,1,'system','2024-12-07 19:10:51.097841','FLFzkJTFLeF5sUoYVqXQOX7TpA0kDFrX','ivkegen12345',''),
	 (0,1,1,2,'system','2024-12-07 19:10:51.098817','U1gGAwvAd5xFc6Q3duVLnD3Xk67A2hwi','ivkegen12345',''),
	 (0,1,1,3,'system','2024-12-07 19:10:51.099793','q48SiQ5qA2skKEo0MMXcxRo15QyeThZS','ivkegen12345','');
INSERT INTO SEC_METRIC_INFO (MAJOR_VER,MINOR_VER,ROW_NUM,COL_NUM,AUDIT_ID,AUDIT_DTM,ENC_VAL_CTT,IV_VAL,ADD_TXT_VAL) VALUES
	 (0,1,1,4,'system','2024-12-07 19:10:51.099793','9wYJqqb1bqdHPLjSRe0ORKCyVm2Rs6Sd','ivkegen12345',''),
	 (0,1,1,5,'system','2024-12-07 19:10:51.10077','iSvgDATWuJhtvIkSQZpJd5fqWUbaakSf','ivkegen12345',''),
	 (0,1,1,6,'system','2024-12-07 19:10:51.101747','t1v3fEtcK06g9HJHPiddfMwdcjt1zaYO','ivkegen12345',''),
	 (0,1,1,7,'system','2024-12-07 19:10:51.102723','iTULJqTIfevDY9MLhaY9Q5Tc1SiyTLcs','ivkegen12345',''),
	 (0,1,1,8,'system','2024-12-07 19:10:51.102723','v0mrneTxgsqO5FHoUsov8XYEGcqpZuAp','ivkegen12345',''),
	 (0,1,1,9,'system','2024-12-07 19:10:51.1037','CpSFA0YcWWtPq82phHufivopi9SNS3CF','ivkegen12345',''),
	 (0,1,1,10,'system','2024-12-07 19:10:51.104986','lpX58WnBCmIDr44ahMvtwviWfu5178o5','ivkegen12345',''),
	 (0,1,1,11,'system','2024-12-07 19:10:51.104986','WWNlSVbZorstup7M474PqIfD6tMolLPF','ivkegen12345',''),
	 (0,1,1,12,'system','2024-12-07 19:10:51.105991','NcL6XVGP23lqS2QUA7IstHs2UXh42jP1','ivkegen12345',''),
	 (0,1,1,13,'system','2024-12-07 19:10:51.107032','U3I8fi4NwzXAfme7Gd4sxLLHbwi0cyyD','ivkegen12345','');
INSERT INTO SEC_METRIC_INFO (MAJOR_VER,MINOR_VER,ROW_NUM,COL_NUM,AUDIT_ID,AUDIT_DTM,ENC_VAL_CTT,IV_VAL,ADD_TXT_VAL) VALUES
	 (0,1,1,14,'system','2024-12-07 19:10:51.108014','6u7JJc0jmb1m6gHjDXAU4kElKfu7744N','ivkegen12345',''),
	 (0,1,1,15,'system','2024-12-07 19:10:51.108014','ZXP6LddVtCzSYj4rq5UfiYHG1kcXE0YB','ivkegen12345',''),
	 (0,1,2,0,'system','2024-12-07 19:10:51.10899','9JgxoQfzJmBmcGd8fHtqiHl8oCHl650G','ivkegen12345',''),
	 (0,1,2,1,'system','2024-12-07 19:10:51.10899','1veRmnIVspOYde3pAm5q8aFQKZzg1Nko','ivkegen12345',''),
	 (0,1,2,2,'system','2024-12-07 19:10:51.109966','EzJwmc43QW3dNeDdh7n0unwyJkksOxk2','ivkegen12345',''),
	 (0,1,2,3,'system','2024-12-07 19:10:51.109966','fgxXQjl41g2OZO6a9mMc2GDz2soE1C9B','ivkegen12345',''),
	 (0,1,2,4,'system','2024-12-07 19:10:51.110944','g1dJJZPq1xLub8VsbHpQzZ6l0jNYWhfB','ivkegen12345',''),
	 (0,1,2,5,'system','2024-12-07 19:10:51.11192','0x3LF9NBJLPpEKq9onH90zHgEiwrK2jg','ivkegen12345',''),
	 (0,1,2,6,'system','2024-12-07 19:10:51.11192','pYl7NF22pQeGua79UzEd373ZRumOJp5Q','ivkegen12345',''),
	 (0,1,2,7,'system','2024-12-07 19:10:51.112896','claWifC8bh6WvxZclSDqCvmzvZDUoZoi','ivkegen12345','');
INSERT INTO SEC_METRIC_INFO (MAJOR_VER,MINOR_VER,ROW_NUM,COL_NUM,AUDIT_ID,AUDIT_DTM,ENC_VAL_CTT,IV_VAL,ADD_TXT_VAL) VALUES
	 (0,1,2,8,'system','2024-12-07 19:10:51.112896','4uRcGxMG5Tx3qt2MGeAOo1MdW0YiVdNo','ivkegen12345',''),
	 (0,1,2,9,'system','2024-12-07 19:10:51.114849','EOslpxM0zIPHGnlfOatoe0vkQZhBMpaM','ivkegen12345',''),
	 (0,1,2,10,'system','2024-12-07 19:10:51.114849','mjehKDxN9zeTnMk0nBtXlIaMq7wZGfqo','ivkegen12345',''),
	 (0,1,2,11,'system','2024-12-07 19:10:51.115824','CnKa9TIIChw8f318ne0rOxHvpwacoo7Z','ivkegen12345',''),
	 (0,1,2,12,'system','2024-12-07 19:10:51.116801','lTDL3hYcVqO2L0g6OolemW5Z5MdYRRNt','ivkegen12345',''),
	 (0,1,2,13,'system','2024-12-07 19:10:51.117778','STHI3jPUcuHDvv9Q6eew1xFjYUoiITMx','ivkegen12345',''),
	 (0,1,2,14,'system','2024-12-07 19:10:51.117778','bxgC7TCBIo5Sft8etMnk4w3fJf2b2hOC','ivkegen12345',''),
	 (0,1,2,15,'system','2024-12-07 19:10:51.118755','qwSNc67IqCtL3Hf4jFy534tiBISq0Htf','ivkegen12345',''),
	 (0,1,3,0,'system','2024-12-07 19:10:51.118755','4EyCntKy78Z1Plqmi5Y7gNpfadjaue4J','ivkegen12345',''),
	 (0,1,3,1,'system','2024-12-07 19:10:51.119731','YOAdLtsoXeC6S2xUbs3yMmFF5QF7f3Ek','ivkegen12345','');
INSERT INTO SEC_METRIC_INFO (MAJOR_VER,MINOR_VER,ROW_NUM,COL_NUM,AUDIT_ID,AUDIT_DTM,ENC_VAL_CTT,IV_VAL,ADD_TXT_VAL) VALUES
	 (0,1,3,2,'system','2024-12-07 19:10:51.120708','uHu8O3CDPsg3wzY4WmaMQW6KdrLj4leT','ivkegen12345',''),
	 (0,1,3,3,'system','2024-12-07 19:10:51.120708','WllFbpQdyyiZ1svaGNQRCJrdPrNXpIxS','ivkegen12345',''),
	 (0,1,3,4,'system','2024-12-07 19:10:51.121685','8AStC1WPQL30AKjonCft17xmI8cH0Vgm','ivkegen12345',''),
	 (0,1,3,5,'system','2024-12-07 19:10:51.121685','kxj1EdSXMGA8UePBMi0ZZBtm4HndcfmG','ivkegen12345',''),
	 (0,1,3,6,'system','2024-12-07 19:10:51.122661','eauSpjey5ThIitB8Fs8npTR62Yts4BrI','ivkegen12345',''),
	 (0,1,3,7,'system','2024-12-07 19:10:51.122661','PtfHjVTS2vcDaqK56Xdx9royireaPFuv','ivkegen12345',''),
	 (0,1,3,8,'system','2024-12-07 19:10:51.123638','A2DrPAtiIF00uPVKRwDqZHb7H3N69gp6','ivkegen12345',''),
	 (0,1,3,9,'system','2024-12-07 19:10:51.124614','W1aPeLdXWipufyVktt6yB4bDD4mJ3d6N','ivkegen12345',''),
	 (0,1,3,10,'system','2024-12-07 19:10:51.124614','4GE0YUWJCL57PUNcYKceIsWsb7dFTQlG','ivkegen12345',''),
	 (0,1,3,11,'system','2024-12-07 19:10:51.125591','jIhQuEp9u1aUxxvoI0WG7JKhfvnRQOW6','ivkegen12345','');
INSERT INTO SEC_METRIC_INFO (MAJOR_VER,MINOR_VER,ROW_NUM,COL_NUM,AUDIT_ID,AUDIT_DTM,ENC_VAL_CTT,IV_VAL,ADD_TXT_VAL) VALUES
	 (0,1,3,12,'system','2024-12-07 19:10:51.125591','VV2UNd57GyZq2BGc9qgR2mY2pM5WBjWk','ivkegen12345',''),
	 (0,1,3,13,'system','2024-12-07 19:10:51.126567','cuxrr8dK8vxQMxqQkE0hw5geKt2l1HWc','ivkegen12345',''),
	 (0,1,3,14,'system','2024-12-07 19:10:51.127544','p3S7xDQNTN1wHgzQl7f3sCTFD9hzH3gh','ivkegen12345',''),
	 (0,1,3,15,'system','2024-12-07 19:10:51.127544','SPAsXBIRxipal6UTKJ7wFjWhjnqIHqIy','ivkegen12345',''),
	 (0,1,4,0,'system','2024-12-07 19:10:51.128521','uV3viVAjqhhKPKSKceIIlkFNpxuHdGBo','ivkegen12345',''),
	 (0,1,4,1,'system','2024-12-07 19:10:51.129496','VFaH987xH2VXWurqKJisZXrivaOjNgfp','ivkegen12345',''),
	 (0,1,4,2,'system','2024-12-07 19:10:51.130473','QYZlFQorRG4yBq6DW3jAXnSHPwHCAew6','ivkegen12345',''),
	 (0,1,4,3,'system','2024-12-07 19:10:51.130473','vh7f0L9ghM64GzLq6yiMzyYpBA2rsybY','ivkegen12345',''),
	 (0,1,4,4,'system','2024-12-07 19:10:51.131449','dtmLmER3nCgvVOS34WMCPTbr7Pi39gR2','ivkegen12345',''),
	 (0,1,4,5,'system','2024-12-07 19:10:51.132426','rrLndDpAJjHSUWHHy3F63p4gggcVenPV','ivkegen12345','');
INSERT INTO SEC_METRIC_INFO (MAJOR_VER,MINOR_VER,ROW_NUM,COL_NUM,AUDIT_ID,AUDIT_DTM,ENC_VAL_CTT,IV_VAL,ADD_TXT_VAL) VALUES
	 (0,1,4,6,'system','2024-12-07 19:10:51.133403','EjgLTiFitLwxn2Ubxaf4sgLxqZFZIIw8','ivkegen12345',''),
	 (0,1,4,7,'system','2024-12-07 19:10:51.133403','zWAPbRhTkHv4BAsL2Z5WRcqROdbAGOWL','ivkegen12345',''),
	 (0,1,4,8,'system','2024-12-07 19:10:51.13438','xFa30uaVMtXRph3ZbuDPtA00IjmiRnjK','ivkegen12345',''),
	 (0,1,4,9,'system','2024-12-07 19:10:51.13438','RoFjUKHuu7VlCFexSkpxZfgip2Fz9XB0','ivkegen12345',''),
	 (0,1,4,10,'system','2024-12-07 19:10:51.135356','WUbpFHJMKIZmGb8zTsbOXuPfkAFFHj5J','ivkegen12345',''),
	 (0,1,4,11,'system','2024-12-07 19:10:51.135356','r6P73ucBNic7YT4dAPIluM38j68jYpra','ivkegen12345',''),
	 (0,1,4,12,'system','2024-12-07 19:10:51.136333','jnPpvnvmM1luHWvx7NeO6QkgLouAXR20','ivkegen12345',''),
	 (0,1,4,13,'system','2024-12-07 19:10:51.136333','5D7URCkLhROl1eFtnpUUmjJyUr24JKJO','ivkegen12345',''),
	 (0,1,4,14,'system','2024-12-07 19:10:51.137309','7mZAiGtXHSnNHoLqnFjVKtFNFo2fKZjy','ivkegen12345',''),
	 (0,1,4,15,'system','2024-12-07 19:10:51.137309','BVRC7JYz0qZmnQnRach227J6bfRR1thF','ivkegen12345','');
INSERT INTO SEC_METRIC_INFO (MAJOR_VER,MINOR_VER,ROW_NUM,COL_NUM,AUDIT_ID,AUDIT_DTM,ENC_VAL_CTT,IV_VAL,ADD_TXT_VAL) VALUES
	 (0,1,5,0,'system','2024-12-07 19:10:51.138285','5bHzSmxW2ucnyueeA1Z0Ae4FI8R93ifT','ivkegen12345',''),
	 (0,1,5,1,'system','2024-12-07 19:10:51.139261','SisuE5tgaUrQtptHObgzw13bGViNrpWG','ivkegen12345',''),
	 (0,1,5,2,'system','2024-12-07 19:10:51.139261','YZ47NjwfNHRzdQPPTLOT0VJBcnNLNxTc','ivkegen12345',''),
	 (0,1,5,3,'system','2024-12-07 19:10:51.140238','wipMTBZfGuN4oB2qdqTWoNN7LYAMuvXt','ivkegen12345',''),
	 (0,1,5,4,'system','2024-12-07 19:10:51.141214','RzPkVN9gUgHzl8a9WfNcRDUkEQqj9N9C','ivkegen12345',''),
	 (0,1,5,5,'system','2024-12-07 19:10:51.141214','sjqwxCCpWbWbXd7wsR8g37hBpZeRVUwo','ivkegen12345',''),
	 (0,1,5,6,'system','2024-12-07 19:10:51.142191','VJxH6rtXwdKjROoKt1v3IKFhQSFlyCgu','ivkegen12345',''),
	 (0,1,5,7,'system','2024-12-07 19:10:51.143167','qLY0ZDqqmoh3nSLIH6eELp1WGxRLrTou','ivkegen12345',''),
	 (0,1,5,8,'system','2024-12-07 19:10:51.143167','NSv6fEdl2puNduLyBudDtwAPiFBYh7Pp','ivkegen12345',''),
	 (0,1,5,9,'system','2024-12-07 19:10:51.144144','5FWFrzDp6GdvjsjwXmeYTnKqEhqN0M1W','ivkegen12345','');
INSERT INTO SEC_METRIC_INFO (MAJOR_VER,MINOR_VER,ROW_NUM,COL_NUM,AUDIT_ID,AUDIT_DTM,ENC_VAL_CTT,IV_VAL,ADD_TXT_VAL) VALUES
	 (0,1,5,10,'system','2024-12-07 19:10:51.14512','2ENZ7YluXQuy2MPM5gx679ffQFiJcxAe','ivkegen12345',''),
	 (0,1,5,11,'system','2024-12-07 19:10:51.14512','mx9imR5FmPAPk6LmOLDgiRpUu7A1wEvn','ivkegen12345',''),
	 (0,1,5,12,'system','2024-12-07 19:10:51.146097','auUP1kIrmPezsG86SdqmBcVMZupyuA1b','ivkegen12345',''),
	 (0,1,5,13,'system','2024-12-07 19:10:51.147073','eeq6IQRLuSXX9M69yGehyUt052LgSDbb','ivkegen12345',''),
	 (0,1,5,14,'system','2024-12-07 19:10:51.147073','ijnUoFPolDRpD0sJUUiAMUPNEqCY3dwh','ivkegen12345',''),
	 (0,1,5,15,'system','2024-12-07 19:10:51.14805','kXo61CJ2Ghzk1rq9RbBrWsFLw564QeS0','ivkegen12345',''),
	 (0,1,6,0,'system','2024-12-07 19:10:51.14805','GiUGvzo9gSeTVkFXM7Yzy0M5xljP3GGF','ivkegen12345',''),
	 (0,1,6,1,'system','2024-12-07 19:10:51.149026','p6aU8AOKzv78x5TdJt2NtIXCskCCm7um','ivkegen12345',''),
	 (0,1,6,2,'system','2024-12-07 19:10:51.150002','xduQe6cnctaRVKqdGTX1hmwNYWpK1kuK','ivkegen12345',''),
	 (0,1,6,3,'system','2024-12-07 19:10:51.150002','KuYcJxJOSiYlIzdNBer5NwzfMdRIbNHy','ivkegen12345','');
INSERT INTO SEC_METRIC_INFO (MAJOR_VER,MINOR_VER,ROW_NUM,COL_NUM,AUDIT_ID,AUDIT_DTM,ENC_VAL_CTT,IV_VAL,ADD_TXT_VAL) VALUES
	 (0,1,6,4,'system','2024-12-07 19:10:51.150981','ZyLWqafCKZHRESmR64w1OUL9eRJseBh6','ivkegen12345',''),
	 (0,1,6,5,'system','2024-12-07 19:10:51.151956','OLHNBl0oxqxJpl9wa9Eje7CuHeYt1fwq','ivkegen12345',''),
	 (0,1,6,6,'system','2024-12-07 19:10:51.151956','wnJeWbDhYDlSY6poOZpqB0EJnLRkBUaj','ivkegen12345',''),
	 (0,1,6,7,'system','2024-12-07 19:10:51.152937','vkDXJRcAER9LmanZjZySL8lNafI56daI','ivkegen12345',''),
	 (0,1,6,8,'system','2024-12-07 19:10:51.152937','20UiKktiHSfoxU7jQYs0SbEobT0DRzrx','ivkegen12345',''),
	 (0,1,6,9,'system','2024-12-07 19:10:51.152937','WFTkDarUaFup9Wncl7h7k3mtHKhfjtRn','ivkegen12345',''),
	 (0,1,6,10,'system','2024-12-07 19:10:51.153909','k9sJLrOu7szZpG4aXc7hjF0MBKxPfkEu','ivkegen12345',''),
	 (0,1,6,11,'system','2024-12-07 19:10:51.154885','AjqaaRPNgUPtyKLAhkX4DnMXzlOgU35I','ivkegen12345',''),
	 (0,1,6,12,'system','2024-12-07 19:10:51.154885','lpIjxcMUQW13OTz17YwBxcMo50svN6Uh','ivkegen12345',''),
	 (0,1,6,13,'system','2024-12-07 19:10:51.155861','lcwflITt8gFYmF86BvIls61EugDSmHL8','ivkegen12345','');
INSERT INTO SEC_METRIC_INFO (MAJOR_VER,MINOR_VER,ROW_NUM,COL_NUM,AUDIT_ID,AUDIT_DTM,ENC_VAL_CTT,IV_VAL,ADD_TXT_VAL) VALUES
	 (0,1,6,14,'system','2024-12-07 19:10:51.155861','19dzsP9dEr2l7923gQS8MG11qvnpl3E3','ivkegen12345',''),
	 (0,1,6,15,'system','2024-12-07 19:10:51.156838','2mrtsIrIRnFFGOe1x7lhpMccEMLj9i2G','ivkegen12345',''),
	 (0,1,7,0,'system','2024-12-07 19:10:51.156838','eo5sKWGD1kkoGs26zUVqjeNwjmLewU9s','ivkegen12345',''),
	 (0,1,7,1,'system','2024-12-07 19:10:51.157815','VEo0IoAZPGNFoHMI5mVwKtp9WnO77SZX','ivkegen12345',''),
	 (0,1,7,2,'system','2024-12-07 19:10:51.158792','hZbZeyrDLjsjRyUqm8ri8yz6Ogsidg2H','ivkegen12345',''),
	 (0,1,7,3,'system','2024-12-07 19:10:51.158792','OP2YdWU7OyvUIZg8bDtxftk98959KFu8','ivkegen12345',''),
	 (0,1,7,4,'system','2024-12-07 19:10:51.159768','YS2Kn3MP89e3BPKGznDDts9gFG8Q6xKL','ivkegen12345',''),
	 (0,1,7,5,'system','2024-12-07 19:10:51.159768','C3SIB8SrwTbTIOqpCa3ImjzTUioIuoRb','ivkegen12345',''),
	 (0,1,7,6,'system','2024-12-07 19:10:51.160745','FWIkX5jyMhPZKerEQkvEiuf927OY7MUc','ivkegen12345',''),
	 (0,1,7,7,'system','2024-12-07 19:10:51.160745','lv5hfNbSwaJiYhvPjwaen3CzdQTVyufU','ivkegen12345','');
INSERT INTO SEC_METRIC_INFO (MAJOR_VER,MINOR_VER,ROW_NUM,COL_NUM,AUDIT_ID,AUDIT_DTM,ENC_VAL_CTT,IV_VAL,ADD_TXT_VAL) VALUES
	 (0,1,7,8,'system','2024-12-07 19:10:51.161721','hvw0CvcxPDGaDH5Wga2sFbpyvkpZQn7z','ivkegen12345',''),
	 (0,1,7,9,'system','2024-12-07 19:10:51.161721','uxrKXpptd4sZQCoHOlQYBanaJlE1VRic','ivkegen12345',''),
	 (0,1,7,10,'system','2024-12-07 19:10:51.162698','cLTQkHVogQDWBaE0d9wcWGBW65ug5j5q','ivkegen12345',''),
	 (0,1,7,11,'system','2024-12-07 19:10:51.162698','MWjxymHJugZRtDpdQk4KDqqeKCaT8ncv','ivkegen12345',''),
	 (0,1,7,12,'system','2024-12-07 19:10:51.163674','cuxbCDsZzWBS12cA8rvS5F64W9mRzm4b','ivkegen12345',''),
	 (0,1,7,13,'system','2024-12-07 19:10:51.163674','deZPg1LtOuoCehJf4OacAQlef4xwyphF','ivkegen12345',''),
	 (0,1,7,14,'system','2024-12-07 19:10:51.163674','1gqiPmQHtLVEkTzf9ibP0fv7pWtPaZLL','ivkegen12345',''),
	 (0,1,7,15,'system','2024-12-07 19:10:51.164651','qmVLSwrhRIXtRga5I4t6QydZyyhdFkqT','ivkegen12345',''),
	 (0,1,8,0,'system','2024-12-07 19:10:51.165627','vpw8CyGQFchwm6PdagFVy29JKJDWJjWu','ivkegen12345',''),
	 (0,1,8,1,'system','2024-12-07 19:10:51.165627','u2Zu4PEbMEyYSVzPLvsLCJOmAzst1AkH','ivkegen12345','');
INSERT INTO SEC_METRIC_INFO (MAJOR_VER,MINOR_VER,ROW_NUM,COL_NUM,AUDIT_ID,AUDIT_DTM,ENC_VAL_CTT,IV_VAL,ADD_TXT_VAL) VALUES
	 (0,1,8,2,'system','2024-12-07 19:10:51.165627','qKXpKhEJf1JznDUZRnhDO37ZvRuoaz9b','ivkegen12345',''),
	 (0,1,8,3,'system','2024-12-07 19:10:51.166604','6SGUm2VZdC8CGLGbRXDtgPsLbQjiBeKh','ivkegen12345',''),
	 (0,1,8,4,'system','2024-12-07 19:10:51.166604','gek19FgxvxYP6Rajn8a3gsC3SiEv7sxg','ivkegen12345',''),
	 (0,1,8,5,'system','2024-12-07 19:10:51.16758','rarXXXPtXQ1s2S0igSBkO0icCmydfQpb','ivkegen12345',''),
	 (0,1,8,6,'system','2024-12-07 19:10:51.168556','pPGwVMXTsDFQ49K2Jtbdj7GUcUTfEFd4','ivkegen12345',''),
	 (0,1,8,7,'system','2024-12-07 19:10:51.168556','s7HSvxrY9RBXue9dXZkzPNSnL1EKYaNn','ivkegen12345',''),
	 (0,1,8,8,'system','2024-12-07 19:10:51.169534','IUBRJxmaEXKx9bK6ZjwjSpKdYMGbjz4u','ivkegen12345',''),
	 (0,1,8,9,'system','2024-12-07 19:10:51.169534','dZLmbbK46Nx33RuEub2LPFKnERQI3Fml','ivkegen12345',''),
	 (0,1,8,10,'system','2024-12-07 19:10:51.170509','KlUV0orKyzsyvkMA8CBIMQ0jw7WQkuTv','ivkegen12345',''),
	 (0,1,8,11,'system','2024-12-07 19:10:51.170509','EJFAY1wHfNVMFgOx4LFfgAXhmf3THhf5','ivkegen12345','');
INSERT INTO SEC_METRIC_INFO (MAJOR_VER,MINOR_VER,ROW_NUM,COL_NUM,AUDIT_ID,AUDIT_DTM,ENC_VAL_CTT,IV_VAL,ADD_TXT_VAL) VALUES
	 (0,1,8,12,'system','2024-12-07 19:10:51.171486','MbG46xHvi5SYEH6avMYppst9xCQwrdgt','ivkegen12345',''),
	 (0,1,8,13,'system','2024-12-07 19:10:51.171486','fu3mNSemIrXyZFiR35l2MkFvajtIRvwc','ivkegen12345',''),
	 (0,1,8,14,'system','2024-12-07 19:10:51.171486','1Fl7Iz1lIeOA7qHzE4Jjr3z9KxvguUfh','ivkegen12345',''),
	 (0,1,8,15,'system','2024-12-07 19:10:51.172467','VmA9jx6vNn0ZDUv45OsMTtNR70ofZ3ZY','ivkegen12345',''),
	 (0,1,9,0,'system','2024-12-07 19:10:51.17344','FlPir1icB7wGVKbgWSADddrPKQhMl9wr','ivkegen12345',''),
	 (0,1,9,1,'system','2024-12-07 19:10:51.17344','EnuyGEt8QhsPYRrIJHtpsoYEmyms4uPW','ivkegen12345',''),
	 (0,1,9,2,'system','2024-12-07 19:10:51.174416','xMG4zMp0gk4bcXQwm9NxHZ8P0sZJPU80','ivkegen12345',''),
	 (0,1,9,3,'system','2024-12-07 19:10:51.174416','dQxhz6vt5rVsxKgOU0kjOKbIfbTJclUl','ivkegen12345',''),
	 (0,1,9,4,'system','2024-12-07 19:10:51.174416','lJ2sydFJ3XAlq0dkAkwiKIkKMZXLHcm3','ivkegen12345',''),
	 (0,1,9,5,'system','2024-12-07 19:10:51.175392','EKqGLEraNNuH3u7fDZOFPew2oUKmui3o','ivkegen12345','');
INSERT INTO SEC_METRIC_INFO (MAJOR_VER,MINOR_VER,ROW_NUM,COL_NUM,AUDIT_ID,AUDIT_DTM,ENC_VAL_CTT,IV_VAL,ADD_TXT_VAL) VALUES
	 (0,1,9,6,'system','2024-12-07 19:10:51.175392','5vv7TON0LajklFTSE1Qxy36tjZSyy1Rq','ivkegen12345',''),
	 (0,1,9,7,'system','2024-12-07 19:10:51.175392','ix2edpvVn6TArz20FdF39tiBxOjbI0ND','ivkegen12345',''),
	 (0,1,9,8,'system','2024-12-07 19:10:51.176369','gIGYHc5LeBGvgq97jqV3HvjIbBrpEYbK','ivkegen12345',''),
	 (0,1,9,9,'system','2024-12-07 19:10:51.176369','CO35BWdxToZEu9ATbxNL6YYIru6j8Uq2','ivkegen12345',''),
	 (0,1,9,10,'system','2024-12-07 19:10:51.177346','OJ7PJyBoYBq1cvbFueiw6naolHWz5Mz9','ivkegen12345',''),
	 (0,1,9,11,'system','2024-12-07 19:10:51.177346','inved2M0AWynxEoC8w0JovLQQ4fS0KJo','ivkegen12345',''),
	 (0,1,9,12,'system','2024-12-07 19:10:51.177346','g0o6lknYhCRIvm4ex1WuRTxDVml5BBvN','ivkegen12345',''),
	 (0,1,9,13,'system','2024-12-07 19:10:51.178322','vQL5S1H5YbCdQH4qK4faarK0a02s1eMF','ivkegen12345',''),
	 (0,1,9,14,'system','2024-12-07 19:10:51.178322','oZbtNoRdPckEy0yxUxB2bOfl7H4IYZmM','ivkegen12345',''),
	 (0,1,9,15,'system','2024-12-07 19:10:51.178322','joCrduXuHZRVK5Z3JNuU437XBQdIlOR7','ivkegen12345','');
INSERT INTO SEC_METRIC_INFO (MAJOR_VER,MINOR_VER,ROW_NUM,COL_NUM,AUDIT_ID,AUDIT_DTM,ENC_VAL_CTT,IV_VAL,ADD_TXT_VAL) VALUES
	 (0,1,10,0,'system','2024-12-07 19:10:51.179299','IX0qZC2Zrg9aXgxs7JKAGphJVS7ULJKn','ivkegen12345',''),
	 (0,1,10,1,'system','2024-12-07 19:10:51.179299','O6rCDiiKDL4RI6BSR66dWOePOuDJIb2m','ivkegen12345',''),
	 (0,1,10,2,'system','2024-12-07 19:10:51.179299','N0kyfOcSRGNPgE9fZUSR2xQKT9mlzc8e','ivkegen12345',''),
	 (0,1,10,3,'system','2024-12-07 19:10:51.180275','zANrbBOf85Eyv6viuuHwFzceh0x9pz7b','ivkegen12345',''),
	 (0,1,10,4,'system','2024-12-07 19:10:51.180275','l5oWFZvlCdYdvp55ZkvRx1hfJqQYvhsI','ivkegen12345',''),
	 (0,1,10,5,'system','2024-12-07 19:10:51.180275','B6tCG7H696EwTHDrHhmzIbD7AUH7WLYF','ivkegen12345',''),
	 (0,1,10,6,'system','2024-12-07 19:10:51.181251','YtAlUcA7WJD24pFJEZcgYYV6dT0HgLiD','ivkegen12345',''),
	 (0,1,10,7,'system','2024-12-07 19:10:51.181251','YTq4XfCfwf4uHUWsG9PRLliFN4eC3JBj','ivkegen12345',''),
	 (0,1,10,8,'system','2024-12-07 19:10:51.182228','npqhoey2B8m1kki9ndft9ncJ5bn5Wpse','ivkegen12345',''),
	 (0,1,10,9,'system','2024-12-07 19:10:51.182228','dScdJuzJQRyHFq8tKjmnkq9LFDkouG0y','ivkegen12345','');
INSERT INTO SEC_METRIC_INFO (MAJOR_VER,MINOR_VER,ROW_NUM,COL_NUM,AUDIT_ID,AUDIT_DTM,ENC_VAL_CTT,IV_VAL,ADD_TXT_VAL) VALUES
	 (0,1,10,10,'system','2024-12-07 19:10:51.182228','UNFYfS3yKGm6Rv4wfKAXEXC5XYp6kW1f','ivkegen12345',''),
	 (0,1,10,11,'system','2024-12-07 19:10:51.183204','hxRk7DpgptqlpvllPWN0WSI7WaIaILJK','ivkegen12345',''),
	 (0,1,10,12,'system','2024-12-07 19:10:51.183204','Auyfv6lNZiNuqyf8XKiSmp6vjFB2OwLX','ivkegen12345',''),
	 (0,1,10,13,'system','2024-12-07 19:10:51.184181','AlAxmG4vCox6Ieh5mOQKAQQbGtNXliYJ','ivkegen12345',''),
	 (0,1,10,14,'system','2024-12-07 19:10:51.184181','XOKrG66ELjBU1cwvMxZPLNL9ZRIWUAvC','ivkegen12345',''),
	 (0,1,10,15,'system','2024-12-07 19:10:51.185157','h8YL2h1Su3sTwoB26kVmyZ7uCJ4xG2Su','ivkegen12345',''),
	 (0,1,11,0,'system','2024-12-07 19:10:51.185157','dVIycV3cob3ULtdkWUOpMh9Iv5OPMmVL','ivkegen12345',''),
	 (0,1,11,1,'system','2024-12-07 19:10:51.186135','rC7pKfBHc2n0dzw1kq4I60qDfjJjSoOE','ivkegen12345',''),
	 (0,1,11,2,'system','2024-12-07 19:10:51.186135','0oU5BnytnXl4tvqaKwpfIWmsqFp00uOL','ivkegen12345',''),
	 (0,1,11,3,'system','2024-12-07 19:10:51.186135','Dlhud4JkZH0ZwfRoWhLhAc6ydq7WbDXW','ivkegen12345','');
INSERT INTO SEC_METRIC_INFO (MAJOR_VER,MINOR_VER,ROW_NUM,COL_NUM,AUDIT_ID,AUDIT_DTM,ENC_VAL_CTT,IV_VAL,ADD_TXT_VAL) VALUES
	 (0,1,11,4,'system','2024-12-07 19:10:51.187111','HD2oQgB10dMWdGQ2lwumsMuQAWbkYjx9','ivkegen12345',''),
	 (0,1,11,5,'system','2024-12-07 19:10:51.187111','mvc4nj2fQpMuVvd5hexrKaj2BZmkhxX3','ivkegen12345',''),
	 (0,1,11,6,'system','2024-12-07 19:10:51.188086','aGxRHkt7SQ3YUJBKwfpHyOHZrJp4fGZt','ivkegen12345',''),
	 (0,1,11,7,'system','2024-12-07 19:10:51.188086','3t2sXtAARG76zisGX0K3J0PR9P5yntys','ivkegen12345',''),
	 (0,1,11,8,'system','2024-12-07 19:10:51.189063','qTA5CvZJE4YKhWT6zwAKjoxpD9tzYXse','ivkegen12345',''),
	 (0,1,11,9,'system','2024-12-07 19:10:51.189063','ktslHWdJB7lIZq8vrjGypr3WcJQHgB4t','ivkegen12345',''),
	 (0,1,11,10,'system','2024-12-07 19:10:51.189063','K5q7QsXybRz3jjvhAbaFVF1fYVLuqOUg','ivkegen12345',''),
	 (0,1,11,11,'system','2024-12-07 19:10:51.19004','HkBFIcpm56zRDe7fMl1uT8xBUinOjbnd','ivkegen12345',''),
	 (0,1,11,12,'system','2024-12-07 19:10:51.19004','ZiDaraO88kEMMBMJdX6Ki9HlXNY1xCDO','ivkegen12345',''),
	 (0,1,11,13,'system','2024-12-07 19:10:51.191016','o8sLoeUiZfcK0J94NbIjUBKwEKdNVScN','ivkegen12345','');
INSERT INTO SEC_METRIC_INFO (MAJOR_VER,MINOR_VER,ROW_NUM,COL_NUM,AUDIT_ID,AUDIT_DTM,ENC_VAL_CTT,IV_VAL,ADD_TXT_VAL) VALUES
	 (0,1,11,14,'system','2024-12-07 19:10:51.191016','39ktWdQb4fH3sFSxrIugZyOPEMFOI8Ax','ivkegen12345',''),
	 (0,1,11,15,'system','2024-12-07 19:10:51.191993','Qfe8HPjavzCmq0zaJE0Mame14SIOb5Iy','ivkegen12345',''),
	 (0,1,12,0,'system','2024-12-07 19:10:51.191993','KDttZhPKIvJgFdOtG5SEZ1PShQO5P21w','ivkegen12345',''),
	 (0,1,12,1,'system','2024-12-07 19:10:51.19297','dFOC2xCsHwsWsLSGZJJkwXHLhLvzhpgp','ivkegen12345',''),
	 (0,1,12,2,'system','2024-12-07 19:10:51.19297','jSZYfalO5Rs23cvLb0LH3fU3jofnxSgP','ivkegen12345',''),
	 (0,1,12,3,'system','2024-12-07 19:10:51.193947','UrUn5Qd60MzeX8pCH5XEyQLVxLbjvF71','ivkegen12345',''),
	 (0,1,12,4,'system','2024-12-07 19:10:51.193947','VMP03AVnJ1zC6HMoHMRdCaY2lRTfKno1','ivkegen12345',''),
	 (0,1,12,5,'system','2024-12-07 19:10:51.193947','0XzHahusIlZDYhKuir3c7QCFZLOL6Sfi','ivkegen12345',''),
	 (0,1,12,6,'system','2024-12-07 19:10:51.194922','EP1wweGJzU7IWHxgsxH57lBiNtf6y00F','ivkegen12345',''),
	 (0,1,12,7,'system','2024-12-07 19:10:51.194922','Yy2bEdp2NeJ3UQiAUeaxYQtWyRHojrMN','ivkegen12345','');
INSERT INTO SEC_METRIC_INFO (MAJOR_VER,MINOR_VER,ROW_NUM,COL_NUM,AUDIT_ID,AUDIT_DTM,ENC_VAL_CTT,IV_VAL,ADD_TXT_VAL) VALUES
	 (0,1,12,8,'system','2024-12-07 19:10:51.194922','n0KxQt5hVujE5JWXfmCN4laeO7FwmtvB','ivkegen12345',''),
	 (0,1,12,9,'system','2024-12-07 19:10:51.195898','clSq2DJAdPCbud1QRquGWl3WBuxARrlF','ivkegen12345',''),
	 (0,1,12,10,'system','2024-12-07 19:10:51.195898','veblCZBrlTuvVhDWwxp8vFPNYDintAEg','ivkegen12345',''),
	 (0,1,12,11,'system','2024-12-07 19:10:51.195898','YjpiMNYvGW8YZOoNxFkmxoCz70TaTUVO','ivkegen12345',''),
	 (0,1,12,12,'system','2024-12-07 19:10:51.196876','Ba60EBgPGZp6LGCsiCiOxIv5wR34EfbT','ivkegen12345',''),
	 (0,1,12,13,'system','2024-12-07 19:10:51.197851','kKJaoKmMoggIFUtyXqmYsmP1LHItQat7','ivkegen12345',''),
	 (0,1,12,14,'system','2024-12-07 19:10:51.197851','1UDdWSd0dgPI0LyEKpdbZcN5i5Q7R1PX','ivkegen12345',''),
	 (0,1,12,15,'system','2024-12-07 19:10:51.197851','sJF7Q3NEad8llqFbw6caYINRwzKiUUX4','ivkegen12345',''),
	 (0,1,13,0,'system','2024-12-07 19:10:51.198827','WO99qtCVSosSfiI16QiSl6n3CZEf3oom','ivkegen12345',''),
	 (0,1,13,1,'system','2024-12-07 19:10:51.198827','nKWbESZ4YVWb75hAOkacSHojMtJhETyE','ivkegen12345','');
INSERT INTO SEC_METRIC_INFO (MAJOR_VER,MINOR_VER,ROW_NUM,COL_NUM,AUDIT_ID,AUDIT_DTM,ENC_VAL_CTT,IV_VAL,ADD_TXT_VAL) VALUES
	 (0,1,13,2,'system','2024-12-07 19:10:51.198827','Y8C1BfhXJpy0ReyGdL4lYgP12y6y0JDb','ivkegen12345',''),
	 (0,1,13,3,'system','2024-12-07 19:10:51.199804','T6H4EP4DL53uOFhLv92liSZU7xMoHW20','ivkegen12345',''),
	 (0,1,13,4,'system','2024-12-07 19:10:51.199804','LKCXVC7xSxzlQ9kH5fjJZJyTY6KALcLi','ivkegen12345',''),
	 (0,1,13,5,'system','2024-12-07 19:10:51.199804','kQRV6ZIEZaIFq9IC7BX1cwmWh2cjZ6jD','ivkegen12345',''),
	 (0,1,13,6,'system','2024-12-07 19:10:51.200781','hLKbgWQDMVxRmXrBUqfgYZCdctmubdnC','ivkegen12345',''),
	 (0,1,13,7,'system','2024-12-07 19:10:51.200781','PfePjEILqFpQjzyELHdP6QHNAcVxFwS2','ivkegen12345',''),
	 (0,1,13,8,'system','2024-12-07 19:10:51.200781','d7NTSv9qQvu1J5koYSt7HrIjTDzhAGRG','ivkegen12345',''),
	 (0,1,13,9,'system','2024-12-07 19:10:51.201758','2XvLEpqIGTzn8izrFgUxUlprwB5FTa8I','ivkegen12345',''),
	 (0,1,13,10,'system','2024-12-07 19:10:51.201758','HgyAsXdg3gd2Q3uL5LyTlutxfpfi1bRn','ivkegen12345',''),
	 (0,1,13,11,'system','2024-12-07 19:10:51.202734','ZKsra0J2R9g1Yn8p8B0EBc7iHUbbSgRh','ivkegen12345','');
INSERT INTO SEC_METRIC_INFO (MAJOR_VER,MINOR_VER,ROW_NUM,COL_NUM,AUDIT_ID,AUDIT_DTM,ENC_VAL_CTT,IV_VAL,ADD_TXT_VAL) VALUES
	 (0,1,13,12,'system','2024-12-07 19:10:51.202734','7l6g6LC88A0B99LldBi7Xwyq3wdcXBh2','ivkegen12345',''),
	 (0,1,13,13,'system','2024-12-07 19:10:51.202734','reyuw4WW09ZTX96DBwxyti3n1f63lHvG','ivkegen12345',''),
	 (0,1,13,14,'system','2024-12-07 19:10:51.203711','2WIV7jj9JQ8TMSPbyJC5ewYo2Rht36Yw','ivkegen12345',''),
	 (0,1,13,15,'system','2024-12-07 19:10:51.203711','enq8Q84UjFQSvauV2LKSjLntsmNbmAHR','ivkegen12345',''),
	 (0,1,14,0,'system','2024-12-07 19:10:51.203711','IWke2JVEh3Tfcn3R4Zyl6pzuPqznxbkR','ivkegen12345',''),
	 (0,1,14,1,'system','2024-12-07 19:10:51.203711','w6Amlow4MHAbHZfcS7wrXYBaxj7SUUYP','ivkegen12345',''),
	 (0,1,14,2,'system','2024-12-07 19:10:51.204687','xBNynQSbDB3OO6k08m2HM0MOksMtrQKE','ivkegen12345',''),
	 (0,1,14,3,'system','2024-12-07 19:10:51.205663','YbNs9IjdzN0iF51TD8Fh6spix5P4Wppu','ivkegen12345',''),
	 (0,1,14,4,'system','2024-12-07 19:10:51.205663','hrORKpYflyHWzdq6cCMYv1UkVxcMAt2J','ivkegen12345',''),
	 (0,1,14,5,'system','2024-12-07 19:10:51.205663','bCDLqbutwZm55Y1hy08aiEzGDyheGRBi','ivkegen12345','');
INSERT INTO SEC_METRIC_INFO (MAJOR_VER,MINOR_VER,ROW_NUM,COL_NUM,AUDIT_ID,AUDIT_DTM,ENC_VAL_CTT,IV_VAL,ADD_TXT_VAL) VALUES
	 (0,1,14,6,'system','2024-12-07 19:10:51.20664','U23bXcGbnTHjuMtYhEYl7829lilB3lCX','ivkegen12345',''),
	 (0,1,14,7,'system','2024-12-07 19:10:51.20664','6NIksGOB706ExQL4w3wmQYMZQIsE89Td','ivkegen12345',''),
	 (0,1,14,8,'system','2024-12-07 19:10:51.20664','nnEmahx43GR0z1BuduOANEQvlo6ny2zd','ivkegen12345',''),
	 (0,1,14,9,'system','2024-12-07 19:10:51.207618','h4YddSlxfG82NsdscacYMkTeneM8g6xT','ivkegen12345',''),
	 (0,1,14,10,'system','2024-12-07 19:10:51.207618','VooNsrzjm1Yaka3952i4WpSjKgC1DhIt','ivkegen12345',''),
	 (0,1,14,11,'system','2024-12-07 19:10:51.207618','McXW50ne8N0TUPiXQa25De402iKY0Shq','ivkegen12345',''),
	 (0,1,14,12,'system','2024-12-07 19:10:51.208593','jXAvgHZigHL7HnWlzyXQUzYGuYttmfSg','ivkegen12345',''),
	 (0,1,14,13,'system','2024-12-07 19:10:51.208593','3UkLrGPT3ctJpyuV3nyZSB0CrlrsH9Q4','ivkegen12345',''),
	 (0,1,14,14,'system','2024-12-07 19:10:51.209571','vvTMMsiRelwYZIgu1iF9ZZSCis2mqOrA','ivkegen12345',''),
	 (0,1,14,15,'system','2024-12-07 19:10:51.209571','H5osEuICpXI6U2lZs2Gngohwaosh6TIm','ivkegen12345','');
INSERT INTO SEC_METRIC_INFO (MAJOR_VER,MINOR_VER,ROW_NUM,COL_NUM,AUDIT_ID,AUDIT_DTM,ENC_VAL_CTT,IV_VAL,ADD_TXT_VAL) VALUES
	 (0,1,15,0,'system','2024-12-07 19:10:51.209571','5P4iB59cbueGa7QaiZriTAmQxuyjWpvi','ivkegen12345',''),
	 (0,1,15,1,'system','2024-12-07 19:10:51.210547','nYzKQEGYJENAKKWPN3tuTmQhOpklOt21','ivkegen12345',''),
	 (0,1,15,2,'system','2024-12-07 19:10:51.210547','pKYIWdbLeG5wCIVhj5GVGVD6V13WVGrH','ivkegen12345',''),
	 (0,1,15,3,'system','2024-12-07 19:10:51.210547','ePTb1TcqBkq6ZSqgf32JOYTURQ8J3LLK','ivkegen12345',''),
	 (0,1,15,4,'system','2024-12-07 19:10:51.211523','7EGjD2iKmJOgrBTHiFRTJjCisV8YkPYF','ivkegen12345',''),
	 (0,1,15,5,'system','2024-12-07 19:10:51.211523','Awr83Ndcfyl4Ektx7XZy5WBUio9lCO1f','ivkegen12345',''),
	 (0,1,15,6,'system','2024-12-07 19:10:51.212501','OMHVNcfFSE9o2d6GJ9ictzyDf1FIYQei','ivkegen12345',''),
	 (0,1,15,7,'system','2024-12-07 19:10:51.212501','QM45GAkQEq1s3QOXhqEQEgx3Tw1ttinp','ivkegen12345',''),
	 (0,1,15,8,'system','2024-12-07 19:10:51.212501','Awm001x8knDo1TJh5TLXQhkRpyYbkiC8','ivkegen12345',''),
	 (0,1,15,9,'system','2024-12-07 19:10:51.213476','njF6sR8g7smMKVzpJLbYunW1P2hKTFIm','ivkegen12345','');
INSERT INTO SEC_METRIC_INFO (MAJOR_VER,MINOR_VER,ROW_NUM,COL_NUM,AUDIT_ID,AUDIT_DTM,ENC_VAL_CTT,IV_VAL,ADD_TXT_VAL) VALUES
	 (0,1,15,10,'system','2024-12-07 19:10:51.213476','WgBwwjRu08ndDp48xfb78jvu2Ek2M7BB','ivkegen12345',''),
	 (0,1,15,11,'system','2024-12-07 19:10:51.213476','tRpH9uLo75OR7indLtOCjHXLIwyjs4yT','ivkegen12345',''),
	 (0,1,15,12,'system','2024-12-07 19:10:51.214453','ko0B2E6emD9VrSO7gt9J51n7sY9gVWe0','ivkegen12345',''),
	 (0,1,15,13,'system','2024-12-07 19:10:51.214453','MkVdtGs9zOuo6IKlpdmWw0IWIMSpE37s','ivkegen12345',''),
	 (0,1,15,14,'system','2024-12-07 19:10:51.214453','CEjUQlkIEhjlqf4t7HM8VdWRcuxWIxrR','ivkegen12345',''),
	 (0,1,15,15,'system','2024-12-07 19:10:51.215429','gAwTDJNheqcpzT4J4b3EpOnwlRq0yP6g','ivkegen12345','');


-- 스크린정보
INSERT INTO SEC_SCREEN_INFO (SCRN_ID,MAJOR_VER,MINOR_VER,SCR_SEQ,AUDIT_ID,AUDIT_DTM,SCRN_NM,SCRN_ROW,SCRN_COL,DEFAULT_YN) VALUES
	 (0,0,1,1,'system','2024-12-07 10:08:14','Screen_0',0,3,'N'),
	 (0,0,1,2,'system','2024-12-07 10:08:14','Screen_0',1,9,'N'),
	 (0,0,1,3,'system','2024-12-07 10:08:14','Screen_0',2,6,'N'),
	 (0,0,1,4,'system','2024-12-07 10:08:14','Screen_0',5,7,'N'),
	 (0,0,1,5,'system','2024-12-07 10:08:14','Screen_0',5,3,'N'),
	 (0,0,1,6,'system','2024-12-07 10:08:14','Screen_0',13,2,'N'),
	 (0,0,1,7,'system','2024-12-07 10:08:14','Screen_0',6,10,'N'),
	 (0,0,1,8,'system','2024-12-07 10:08:14','Screen_0',15,5,'N'),
	 (0,0,1,9,'system','2024-12-07 10:08:14','Screen_0',8,2,'N'),
	 (0,0,1,10,'system','2024-12-07 10:08:14','Screen_0',15,15,'Y');
INSERT INTO SEC_SCREEN_INFO (SCRN_ID,MAJOR_VER,MINOR_VER,SCR_SEQ,AUDIT_ID,AUDIT_DTM,SCRN_NM,SCRN_ROW,SCRN_COL,DEFAULT_YN) VALUES
	 (1,0,1,1,'system','2024-12-07 10:08:14','Screen_1',9,4,'N'),
	 (1,0,1,2,'system','2024-12-07 10:08:14','Screen_1',6,0,'N'),
	 (1,0,1,3,'system','2024-12-07 10:08:14','Screen_1',9,0,'N'),
	 (1,0,1,4,'system','2024-12-07 10:08:14','Screen_1',12,11,'N'),
	 (1,0,1,5,'system','2024-12-07 10:08:14','Screen_1',12,8,'N'),
	 (1,0,1,6,'system','2024-12-07 10:08:14','Screen_1',2,7,'N'),
	 (1,0,1,7,'system','2024-12-07 10:08:14','Screen_1',0,3,'N'),
	 (1,0,1,8,'system','2024-12-07 10:08:14','Screen_1',7,0,'N'),
	 (1,0,1,9,'system','2024-12-07 10:08:14','Screen_1',13,3,'N'),
	 (1,0,1,10,'system','2024-12-07 10:08:14','Screen_1',15,15,'Y');
INSERT INTO SEC_SCREEN_INFO (SCRN_ID,MAJOR_VER,MINOR_VER,SCR_SEQ,AUDIT_ID,AUDIT_DTM,SCRN_NM,SCRN_ROW,SCRN_COL,DEFAULT_YN) VALUES
	 (2,0,1,1,'system','2024-12-07 10:08:14','Screen_2',9,0,'N'),
	 (2,0,1,2,'system','2024-12-07 10:08:14','Screen_2',10,12,'N'),
	 (2,0,1,3,'system','2024-12-07 10:08:14','Screen_2',3,14,'N'),
	 (2,0,1,4,'system','2024-12-07 10:08:14','Screen_2',4,2,'N'),
	 (2,0,1,5,'system','2024-12-07 10:08:14','Screen_2',13,11,'N'),
	 (2,0,1,6,'system','2024-12-07 10:08:14','Screen_2',1,2,'N'),
	 (2,0,1,7,'system','2024-12-07 10:08:14','Screen_2',8,10,'N'),
	 (2,0,1,8,'system','2024-12-07 10:08:14','Screen_2',3,14,'N'),
	 (2,0,1,9,'system','2024-12-07 10:08:14','Screen_2',12,11,'N'),
	 (2,0,1,10,'system','2024-12-07 10:08:14','Screen_2',15,15,'Y');
INSERT INTO SEC_SCREEN_INFO (SCRN_ID,MAJOR_VER,MINOR_VER,SCR_SEQ,AUDIT_ID,AUDIT_DTM,SCRN_NM,SCRN_ROW,SCRN_COL,DEFAULT_YN) VALUES
	 (3,0,1,1,'system','2024-12-07 10:08:14','Screen_3',5,0,'N'),
	 (3,0,1,2,'system','2024-12-07 10:08:14','Screen_3',0,4,'N'),
	 (3,0,1,3,'system','2024-12-07 10:08:14','Screen_3',12,5,'N'),
	 (3,0,1,4,'system','2024-12-07 10:08:14','Screen_3',3,4,'N'),
	 (3,0,1,5,'system','2024-12-07 10:08:14','Screen_3',15,5,'N'),
	 (3,0,1,6,'system','2024-12-07 10:08:14','Screen_3',15,2,'N'),
	 (3,0,1,7,'system','2024-12-07 10:08:14','Screen_3',0,1,'N'),
	 (3,0,1,8,'system','2024-12-07 10:08:14','Screen_3',2,5,'N'),
	 (3,0,1,9,'system','2024-12-07 10:08:14','Screen_3',2,6,'N'),
	 (3,0,1,10,'system','2024-12-07 10:08:14','Screen_3',15,15,'Y');
INSERT INTO SEC_SCREEN_INFO (SCRN_ID,MAJOR_VER,MINOR_VER,SCR_SEQ,AUDIT_ID,AUDIT_DTM,SCRN_NM,SCRN_ROW,SCRN_COL,DEFAULT_YN) VALUES
	 (4,0,1,1,'system','2024-12-07 10:08:14','Screen_4',4,10,'N'),
	 (4,0,1,2,'system','2024-12-07 10:08:14','Screen_4',8,15,'N'),
	 (4,0,1,3,'system','2024-12-07 10:08:14','Screen_4',6,12,'N'),
	 (4,0,1,4,'system','2024-12-07 10:08:14','Screen_4',5,11,'N'),
	 (4,0,1,5,'system','2024-12-07 10:08:14','Screen_4',3,15,'N'),
	 (4,0,1,6,'system','2024-12-07 10:08:14','Screen_4',6,15,'N'),
	 (4,0,1,7,'system','2024-12-07 10:08:14','Screen_4',4,7,'N'),
	 (4,0,1,8,'system','2024-12-07 10:08:14','Screen_4',7,6,'N'),
	 (4,0,1,9,'system','2024-12-07 10:08:14','Screen_4',11,3,'N'),
	 (4,0,1,10,'system','2024-12-07 10:08:14','Screen_4',15,15,'Y');
INSERT INTO SEC_SCREEN_INFO (SCRN_ID,MAJOR_VER,MINOR_VER,SCR_SEQ,AUDIT_ID,AUDIT_DTM,SCRN_NM,SCRN_ROW,SCRN_COL,DEFAULT_YN) VALUES
	 (5,0,1,1,'system','2024-12-07 10:08:14','Screen_5',2,7,'N'),
	 (5,0,1,2,'system','2024-12-07 10:08:14','Screen_5',11,15,'N'),
	 (5,0,1,3,'system','2024-12-07 10:08:14','Screen_5',10,8,'N'),
	 (5,0,1,4,'system','2024-12-07 10:08:14','Screen_5',9,11,'N'),
	 (5,0,1,5,'system','2024-12-07 10:08:14','Screen_5',2,5,'N'),
	 (5,0,1,6,'system','2024-12-07 10:08:14','Screen_5',10,4,'N'),
	 (5,0,1,7,'system','2024-12-07 10:08:14','Screen_5',15,5,'N'),
	 (5,0,1,8,'system','2024-12-07 10:08:14','Screen_5',12,8,'N'),
	 (5,0,1,9,'system','2024-12-07 10:08:14','Screen_5',8,11,'N'),
	 (5,0,1,10,'system','2024-12-07 10:08:14','Screen_5',15,15,'Y');
INSERT INTO SEC_SCREEN_INFO (SCRN_ID,MAJOR_VER,MINOR_VER,SCR_SEQ,AUDIT_ID,AUDIT_DTM,SCRN_NM,SCRN_ROW,SCRN_COL,DEFAULT_YN) VALUES
	 (6,0,1,1,'system','2024-12-07 10:08:14','Screen_6',3,12,'N'),
	 (6,0,1,2,'system','2024-12-07 10:08:14','Screen_6',7,4,'N'),
	 (6,0,1,3,'system','2024-12-07 10:08:14','Screen_6',1,8,'N'),
	 (6,0,1,4,'system','2024-12-07 10:08:14','Screen_6',2,8,'N'),
	 (6,0,1,5,'system','2024-12-07 10:08:14','Screen_6',11,8,'N'),
	 (6,0,1,6,'system','2024-12-07 10:08:14','Screen_6',2,7,'N'),
	 (6,0,1,7,'system','2024-12-07 10:08:14','Screen_6',4,5,'N'),
	 (6,0,1,8,'system','2024-12-07 10:08:14','Screen_6',15,3,'N'),
	 (6,0,1,9,'system','2024-12-07 10:08:14','Screen_6',7,3,'N'),
	 (6,0,1,10,'system','2024-12-07 10:08:14','Screen_6',15,15,'Y');
INSERT INTO SEC_SCREEN_INFO (SCRN_ID,MAJOR_VER,MINOR_VER,SCR_SEQ,AUDIT_ID,AUDIT_DTM,SCRN_NM,SCRN_ROW,SCRN_COL,DEFAULT_YN) VALUES
	 (7,0,1,1,'system','2024-12-07 10:08:14','Screen_7',0,10,'N'),
	 (7,0,1,2,'system','2024-12-07 10:08:14','Screen_7',3,0,'N'),
	 (7,0,1,3,'system','2024-12-07 10:08:14','Screen_7',7,15,'N'),
	 (7,0,1,4,'system','2024-12-07 10:08:14','Screen_7',9,4,'N'),
	 (7,0,1,5,'system','2024-12-07 10:08:14','Screen_7',2,12,'N'),
	 (7,0,1,6,'system','2024-12-07 10:08:14','Screen_7',9,1,'N'),
	 (7,0,1,7,'system','2024-12-07 10:08:14','Screen_7',4,4,'N'),
	 (7,0,1,8,'system','2024-12-07 10:08:14','Screen_7',1,12,'N'),
	 (7,0,1,9,'system','2024-12-07 10:08:14','Screen_7',13,4,'N'),
	 (7,0,1,10,'system','2024-12-07 10:08:14','Screen_7',15,15,'Y');
INSERT INTO SEC_SCREEN_INFO (SCRN_ID,MAJOR_VER,MINOR_VER,SCR_SEQ,AUDIT_ID,AUDIT_DTM,SCRN_NM,SCRN_ROW,SCRN_COL,DEFAULT_YN) VALUES
	 (8,0,1,1,'system','2024-12-07 10:08:14','Screen_7',10,10,'N'),
	 (8,0,1,2,'system','2024-12-07 10:08:14','Screen_7',6,12,'N'),
	 (8,0,1,3,'system','2024-12-07 10:08:14','Screen_7',5,10,'N'),
	 (8,0,1,4,'system','2024-12-07 10:08:14','Screen_7',11,8,'N'),
	 (8,0,1,5,'system','2024-12-07 10:08:14','Screen_7',6,3,'N'),
	 (8,0,1,6,'system','2024-12-07 10:08:14','Screen_7',10,15,'N'),
	 (8,0,1,7,'system','2024-12-07 10:08:14','Screen_7',10,13,'N'),
	 (8,0,1,8,'system','2024-12-07 10:08:14','Screen_7',15,3,'N'),
	 (8,0,1,9,'system','2024-12-07 10:08:14','Screen_7',15,5,'N'),
	 (8,0,1,10,'system','2024-12-07 10:08:14','Screen_7',15,15,'Y');
INSERT INTO SEC_SCREEN_INFO (SCRN_ID,MAJOR_VER,MINOR_VER,SCR_SEQ,AUDIT_ID,AUDIT_DTM,SCRN_NM,SCRN_ROW,SCRN_COL,DEFAULT_YN) VALUES
	 (9,0,1,1,'system','2024-12-07 10:08:14','Screen_9',2,14,'N'),
	 (9,0,1,2,'system','2024-12-07 10:08:14','Screen_9',4,11,'N'),
	 (9,0,1,3,'system','2024-12-07 10:08:14','Screen_9',7,9,'N'),
	 (9,0,1,4,'system','2024-12-07 10:08:14','Screen_9',4,6,'N'),
	 (9,0,1,5,'system','2024-12-07 10:08:14','Screen_9',6,9,'N'),
	 (9,0,1,6,'system','2024-12-07 10:08:14','Screen_9',9,7,'N'),
	 (9,0,1,7,'system','2024-12-07 10:08:14','Screen_9',5,2,'N'),
	 (9,0,1,8,'system','2024-12-07 10:08:14','Screen_9',13,8,'N'),
	 (9,0,1,9,'system','2024-12-07 10:08:14','Screen_9',5,13,'N'),
	 (9,0,1,10,'system','2024-12-07 10:08:14','Screen_9',15,15,'Y');



-- 스크린 모델 정보 
INSERT INTO SCRN_MDL_INFO (EQUIP_MDL_CD,SRCEQUIP_MDL_CD,AUDIT_ID,AUDIT_DTM,SCRN_ID,EXPIRE_DT,RTRV_CNT,ADD_TXT_VAL) VALUES
	 ('HMDL0001','HMDL000123','system','2024-12-07 10:32:56',6,'20251207',2,''),
	 ('HMDL0002','HMDL0002','system','2024-12-07 10:32:56',0,'20251207',2,''),
	 ('HMDL0003','HMDL0003','system','2024-12-07 10:32:56',8,'20251207',2,''),
	 ('HMDL0004','HMDL0004','system','2024-12-07 10:32:56',8,'20251207',2,''),
	 ('HMDL0005','HMDL0005','system','2024-12-07 10:32:56',3,'20251207',2,''),
	 ('HX20001','HX20001234','system','2024-12-07 10:32:56',2,'20251207',2,'');
