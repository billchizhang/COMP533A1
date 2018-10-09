package emailwithlogging;

public class Email {
	
	private String address; 
	private String username; 
	private String password; 
	
	public Email(String address, String username, String password) {
		this.address = address; 
		this.username = username; 
		this.password = password; 
	}
	
	public void setPassword(String newPassword) throws Exception {
		
			this.password = newPassword; 
		
	}
	
	public String toString() {
        String returnedString = "Email " + address + " of " + username;
        return returnedString;
    }

}
