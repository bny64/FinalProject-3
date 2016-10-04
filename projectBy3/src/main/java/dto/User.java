package dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Repository;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
	int userNo;
	String userId;
	String password;
	String nickname;
	String userName;
	String tel;
	String email;
	@DateTimeFormat(pattern="yy-MM-dd")
	Date birthdate;
}
