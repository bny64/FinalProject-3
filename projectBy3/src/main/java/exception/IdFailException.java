package exception;

public class IdFailException extends RuntimeException{
	public IdFailException(){
		super("없는 아이디 입니다");
	}
}
