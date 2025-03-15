
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import models.Account;

public class LoginDAO extends DBContext{
    public LoginDAO(){
        super();
    }
    //Login Function
    public Account login(String email, String password){
        Account account = null;
        try {
            String sql = "SELECT * FROM Account where email=? AND password=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                int id = rs.getInt("id");
                String name =  rs.getString("username");
                String emailData =  rs.getString("email");
                String passwordData =  rs.getString("password");
                int role = rs.getInt("role");
                account = new Account(id, name, emailData, passwordData, role);
            }
            
        } catch (Exception e) {
            System.err.println("Error: " + e.getMessage());
        }
        return account;
    }
    public static void main(String[] args) {
        System.out.println(new LoginDAO().login("admin@gmail.com", "123"));
    }
}
