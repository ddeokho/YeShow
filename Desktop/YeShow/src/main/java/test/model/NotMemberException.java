package test.model;
/**ȸ���� �ƴ� ��� �߻���ų ����� ���� ���� Ŭ����*/
public class NotMemberException extends Exception {
	
	public NotMemberException(){
		super("NotMemberException");
	}
	public NotMemberException(String msg){
		super(msg);
	}

}
