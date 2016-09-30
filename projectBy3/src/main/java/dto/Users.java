package dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Repository;

@Repository
public class Users {
	Integer userNo;
	String userId;
	String password;
	String nickname;
	String userName;
	String tel;
	String email;
	@DateTimeFormat(pattern="yy-MM-dd")
	Date birthdate;
}
