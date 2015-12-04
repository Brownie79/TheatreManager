/*
Author: Devanshu, Peter, Alex
 */

public class Runner {
    public static SQLConn sqlconn = new SQLConn();
    public static Homepage homepage;
    public static AdminPage admin;
    
    
    
    public static void main(String[] args){
        System.out.println("Homepage setting up");
        homepage = new Homepage();
        
        System.out.println("Admin Page setting up");
        admin = new AdminPage(sqlconn);
        
        //create new "pages" but hide them all
        homepage.setVisible(false);
        
        //set visible
        admin.setVisible(true);
        
        
    }
}
