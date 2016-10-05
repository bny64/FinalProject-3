package dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Board {
	int boardNo;
	String title;
	int hit;
	String content;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	Date writedDate;
	int userNo;
	int categoryNo;
	String imagePath;
}
