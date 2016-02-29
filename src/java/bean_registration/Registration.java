/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bean_registration;

/**
 *
 * @author CDAC-36
 */
public class Registration {

    
    private String userName;
    private String userPassword;
    private String name;
    private String role;
    
    
    public Registration(){        
    }

   

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

     public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
       
    
}


