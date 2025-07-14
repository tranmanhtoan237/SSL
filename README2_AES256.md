# AES 256 암호화 

## 목차
    1. 암호문에 IV를 앞에 붙여서 전달하는 방법
        1.1 암호화 Sample(1)
        1.2 암호화 Sample(2)

### 암호문에 IV를 앞에 붙여서 전달하는 방법
    암호문 앞에 IV를 결합하여 하나의 바이트 배열로 전달합니다.
    복호화 시 암호문에서 IV를 추출합니다.
#### 암호화 Sample(1)

- 기본사항

``` java
#암호화 알고리즘 : AES/GCM/NoPadding
#암호화 키 길이 : 32바이트 (AES-256)
#IV 길이 : 12바이트
#태그 길이 : 128비트
...
 private static final String ALGORITHM = "AES/GCM/NoPadding";
 private static final int KEY_SIZE = 256;
 private static final int IV_SIZE = 12; // GCM recommends 12 bytes IV
 private static final int TAG_LENGTH_BIT = 128; // GCM tag length in bits
...
```

- encrypt   

``` java
............
    // AES256 암호화 (ByteBuffer)
    public static ByteBuffer encrypt(ByteBuffer plaintext, SecretKey key) throws Exception {
        Cipher cipher = Cipher.getInstance(ALGORITHM);
        byte[] iv = new byte[IV_SIZE]; // 초기화 벡터 (IV)
        SecureRandom secureRandom = new SecureRandom();
        secureRandom.nextBytes(iv); // 랜덤 IV 생성
        GCMParameterSpec parameterSpec = new GCMParameterSpec(TAG_LENGTH_BIT, iv);
        cipher.init(Cipher.ENCRYPT_MODE, key, parameterSpec);

        byte[] encryptedBytes = cipher.doFinal(plaintext.array());

        // IV와 암호화된 데이터를 함께 반환
        ByteBuffer cipherTextWithIv = ByteBuffer.allocate(IV_SIZE + encryptedBytes.length);
        cipherTextWithIv.put(iv);
        cipherTextWithIv.put(encryptedBytes);
        cipherTextWithIv.flip();

        return cipherTextWithIv;
    }
..................

```

- decrypt

``` java

.........................
 // AES256 복호화 (ByteBuffer)
    public static ByteBuffer decrypt(ByteBuffer cipherText, SecretKey key) throws Exception {
        Cipher cipher = Cipher.getInstance(ALGORITHM);

        byte[] iv = new byte[IV_SIZE];
        cipherText.get(iv); // IV를 추출
        GCMParameterSpec parameterSpec = new GCMParameterSpec(TAG_LENGTH_BIT, iv);
        cipher.init(Cipher.DECRYPT_MODE, key, parameterSpec);

        byte[] encryptedBytes = new byte[cipherText.remaining()];
        cipherText.get(encryptedBytes);

        byte[] decryptedBytes = cipher.doFinal(encryptedBytes);

        return ByteBuffer.wrap(decryptedBytes);
    }
.........................

```


#### 암호화 Sample(2)

``` java

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.GCMParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import java.security.SecureRandom;
import java.util.Base64;

public class AESGCMEncryption {
    public static void main(String[] args) throws Exception {
        String plainText = "Hello, AES-GCM!";

        // 32바이트 키 생성 (AES-256)
        byte[] keyBytes = new byte[32];
        new SecureRandom().nextBytes(keyBytes);
        SecretKey key = new SecretKeySpec(keyBytes, "AES");

        // 12바이트 IV 생성
        byte[] iv = new byte[12];
        new SecureRandom().nextBytes(iv);

        // AES/GCM/NoPadding 암호화
        Cipher cipher = Cipher.getInstance("AES/GCM/NoPadding");
        GCMParameterSpec gcmSpec = new GCMParameterSpec(128, iv);
        cipher.init(Cipher.ENCRYPT_MODE, key, gcmSpec);

        byte[] encryptedBytes = cipher.doFinal(plainText.getBytes());

        // IV + 암호문 결합
        byte[] combined = new byte[iv.length + encryptedBytes.length];
        System.arraycopy(iv, 0, combined, 0, iv.length);
        System.arraycopy(encryptedBytes, 0, combined, iv.length, encryptedBytes.length);

        System.out.println("Combined (Base64): " + Base64.getEncoder().encodeToString(combined));
    }
}

```
- 복호화 Sample

``` java
import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.GCMParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import java.util.Base64;

public class AESGCMDecryption {
    public static void main(String[] args) throws Exception {
        String combinedBase64 = "암호화된 IV+암호문(Base64 인코딩된 값)";

        // 키 (암호화 시 사용한 키와 동일해야 함)
        byte[] keyBytes = new byte[32]; // 암호화 시 사용한 키로 설정
        SecretKey key = new SecretKeySpec(keyBytes, "AES");

        // Base64로부터 바이트 배열 복원
        byte[] combined = Base64.getDecoder().decode(combinedBase64);

        // IV와 암호문 분리
        byte[] iv = new byte[12];
        byte[] encryptedBytes = new byte[combined.length - 12];
        System.arraycopy(combined, 0, iv, 0, 12);
        System.arraycopy(combined, 12, encryptedBytes, 0, encryptedBytes.length);

        // AES/GCM/NoPadding 복호화
        Cipher cipher = Cipher.getInstance("AES/GCM/NoPadding");
        GCMParameterSpec gcmSpec = new GCMParameterSpec(128, iv);
        cipher.init(Cipher.DECRYPT_MODE, key, gcmSpec);

        byte[] decryptedBytes = cipher.doFinal(encryptedBytes);

        System.out.println("Decrypted: " + new String(decryptedBytes));
    }
}
```