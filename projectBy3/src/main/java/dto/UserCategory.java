package dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserCategory {
	int listNo;
	int categoryNo;
	int userNo;
	Category category;
}
