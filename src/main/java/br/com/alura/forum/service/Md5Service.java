package br.com.alura.forum.service;

import java.security.MessageDigest;

import javax.xml.bind.DatatypeConverter;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class Md5Service implements PasswordEncoder {

	public String encode(CharSequence raw) {
		String rawString = raw.toString();
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(rawString.getBytes());
			byte[] digest = md.digest();
			return DatatypeConverter.printHexBinary(digest).toLowerCase();
		} catch (Exception e) {
			throw new RuntimeException("Erro ao gerar hash MD5 da senha!");
		}
	}

	@Override
	public boolean matches(CharSequence rawPassword, String encodedPassword) {
		String encoded = encode(rawPassword);
		return encoded.equals(encodedPassword);
	}

}
