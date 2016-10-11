package dto;

import java.util.HashSet;
import java.util.Set;

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
	private Set<UserFriend> usersSet; 
}
