package emailwithlogging;

public class EmailWithLogging {
	
	public static void main(String[] args) {
		String email_address = "123@abc.com"; 
		String username = "Bill"; 
		String password = "abc1234"; 
		Email e = new Email(email_address, username, password); 
		
		try {
			e.setPassword("def234");
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
	}

}
