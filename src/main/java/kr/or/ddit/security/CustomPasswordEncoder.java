package kr.or.ddit.security;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import lombok.extern.slf4j.Slf4j;

/* 비밀번호 암호화 처리기
 스프링 시큐리티 5부터는 기본적으로 PasswordEncoder를 지정해야 함
 사용자 테이블(USERS)의 비밀번호 컬럼(PASSWORD)의 비밀번호를 암호화하여 저장해놓아야 함
 테스트를 위해서 암호화를 처리하지 않았으므로 아무 처리를 하지 않고 로그인하면 당연히 로그인 오류가 발생함
 그래서 암호화를 하지 않는 PasswordEncoder를 직접 구현하여 지정하면 로그인 시 암호화를 고려하지 않으므로
 로그인이 잘 됨
 */
/**@Slf4j
public class CustomNoOpPasswordEncoder implements PasswordEncoder {@Override
	//encode : 암호화
	public String encode(CharSequence rawPassword) {
		log.warn("암호화 전 비밀번호 : " + rawPassword);

		return rawPassword.toString();
	}**/
@Slf4j
public class CustomPasswordEncoder implements PasswordEncoder {
    private BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();

    @Override
    public String encode(CharSequence rawPassword) {
        log.warn("암호화 전 비밀번호: " + rawPassword);

        // BCryptPasswordEncoder를 사용하여 비밀번호를 암호화합니다.
        String encodedPassword = bCryptPasswordEncoder.encode(rawPassword);
        log.warn("암호화 후 비밀번호: " + encodedPassword);

        return encodedPassword;
    }

    @Override
    public boolean matches(CharSequence rawPassword, String encodedPassword) {
        log.warn("비교: " + rawPassword + " : " + encodedPassword);

        // BCryptPasswordEncoder를 사용하여 비밀번호를 비교합니다.
        return bCryptPasswordEncoder.matches(rawPassword, encodedPassword);
    }
}
