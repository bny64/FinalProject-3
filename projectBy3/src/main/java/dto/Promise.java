package dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class Promise {
	int promiseId;
	String promiseTitle;
	int promoter; // 주최자
	int invitee; // 초대 받은 사람
	Date promiseDate;
	float promiseLatitude;
	float promiseLongitude;
	String promiseContent;
	String promiseStatus;
}
