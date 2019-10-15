package edu.mtu.cs.lti

import grails.converters.JSON
import grails.util.Environment

import javax.crypto.Cipher
import javax.crypto.spec.SecretKeySpec
import java.security.MessageDigest

class LtiClient {

    String clientId
    String clientSecret

    String kind = 'application' // 'application', 'developer'

    String appEnvironment = Environment.current.name
    String lmsDomain
    String clientDomain

    Date dateCreated
    Date lastUpdated

    static constraints = {
        appEnvironment(nullable: true)
        clientDomain(nullable: true)
        lmsDomain(nullable: true)
    }

    public String clientSecret( ) {
        decrypt(clientSecret)
    }

    public void clientSecret(String secret ) {
        clientSecret = encrypt( secret )
    }

    private String encrypt(String plaintext) {
        if (plaintext == null || plaintext.isEmpty()) {
            return ''
        } else {
            String salt = "" + System.currentTimeMillis()
            String key = "ItsNotBlackMagic;ItsJustJavaCode"
            Cipher c = Cipher.getInstance('AES')
            byte[] keyBytes = MessageDigest.getInstance('SHA-1').digest("$salt$key".getBytes())[0..<16]
            c.init(Cipher.ENCRYPT_MODE, new SecretKeySpec(keyBytes, 'AES'))
            [data: c.doFinal(plaintext.bytes).encodeBase64() as String, salt: salt] as JSON
        }
    }

    private String decrypt(String ciphertext) {
        if (ciphertext == null || ciphertext.isEmpty()) {
            return ''
        } else {
            def json = JSON.parse(ciphertext)
            Cipher c = Cipher.getInstance('AES')
            String key = "ItsNotBlackMagic;ItsJustJavaCode"
            byte[] keyBytes = MessageDigest.getInstance('SHA-1').digest("${json.salt}${key}".getBytes())[0..<16]
            c.init(Cipher.DECRYPT_MODE, new SecretKeySpec(keyBytes, 'AES'))
            new String(c.doFinal(json['data'].decodeBase64()))
        }
    }

}
