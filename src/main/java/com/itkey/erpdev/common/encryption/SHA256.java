package com.itkey.erpdev.common.encryption;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Random;

public class SHA256 {

  public static String getEncrypt(String source, String salt) {
    return getEncrypt(source, salt.getBytes());
  }

  private static String getEncrypt(String source, byte[] salt) {
    String result = "";

    byte[] a = source.getBytes();
    byte[] bytes = new byte[a.length + salt.length];

    System.arraycopy(a, 0, bytes, 0, a.length);
    System.arraycopy(salt, 0, bytes, a.length, salt.length);

    try {
      MessageDigest md = MessageDigest.getInstance("SHA-256");
      md.update(bytes);

      byte[] byteData = md.digest();

      StringBuilder sb;
      sb = new StringBuilder();

      for (byte byteDatum : byteData) {
        sb.append(Integer.toString((byteDatum & 0xFF) + 256, 16).substring(1));
      }

      result = sb.toString();
    } catch (NoSuchAlgorithmException e) {
      e.printStackTrace();
    }
    return result;
  }

  public static String generateSalt() {
    Random random = new Random();

    byte[] salt = new byte[8];
    random.nextBytes(salt);

    StringBuilder sb;
    sb = new StringBuilder();

    for (byte b : salt) {
      // byte 값을 hex 값으로 바꾸기
      sb.append(String.format("%02x", b));
    }
    return sb.toString();
  }
}

