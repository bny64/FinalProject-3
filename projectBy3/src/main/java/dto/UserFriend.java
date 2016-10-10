package dto;

import org.springframework.stereotype.Repository;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserFriend {
	int listNo;
	int friendNo;
	String statue;
	int userNo;
	String alarm;
	String userName;
}
