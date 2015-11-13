//Author: Devanshu Bharel
//small change

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

public class homework2{
    // JDBC driver name and database URL
    static final String JDBC_DRIVER = "oracle.jdbc.OracleDriver";  
    static final String DB_URL = "jdbc:oracle:thin:@fourier.cs.iit.edu:1521:orcl";

    // Database credentials
    static final String USER = "wmei1";
    static final String PASS = "9681868";
    
    //static final String USER = "dbharel";
    //static final String PASS = "YCsBUo3...uK3Y15";
    
    
    //Scanner
    static Scanner input = new Scanner(System.in);
    
    //Database Conn & Statement
    static Connection conn = null;
    static Statement stmt = null;
    
    public static void main(String[] args){
        try{
            //STEP 2: Register JDBC driver
            Class.forName(JDBC_DRIVER);

            //STEP 3: Open a connection
            System.out.println("Connecting to database...");
            conn = DriverManager.getConnection(DB_URL,USER,PASS);
            System.out.println("Succesfully Connected!");
            
            int c = printMenu();
            while(c != -1){
                switch (c){ 
                    case 0:
                        System.out.println("Choice 0");
                        c = printMenu();
                        break;
                    case 1:
                        System.out.println("Choice 1");
                        case1();
                        c = 0;
                        break;
                    case 2:
                        System.out.println("Choice 2");
                        c = 0;
                        break;
                    case 3: 
                        System.out.println("Choice 3");
                        c = 0;
                        break;
                    case 4:
                        System.out.println("Choice 4");
                        c = -1; //quit
                        break;
                    default:
                        c = 0;
                }//switch
            
            
            }
            
        } catch(SQLException se){
        //Handle errors for JDBC
        se.printStackTrace();
        } catch(Exception e){
        //Handle errors for Class.forName
        e.printStackTrace();
        } finally {
            //finally block used to close resources
            try{ if(stmt!=null) { stmt.close(); } }	catch(SQLException se2){}// nothing we can do
            try{ if(conn!=null) { conn.close(); } }     catch(SQLException se) { se.printStackTrace(); }
        }//end finally try    		
    }//end main		

    public static void test(){
        Connection conn = null;
        Statement stmt = null;
        try{
            //STEP 2: Register JDBC driver
            Class.forName(JDBC_DRIVER);

            //STEP 3: Open a connection
            System.out.println("Connecting to database...");
            conn = DriverManager.getConnection(DB_URL,USER,PASS);

            //STEP 4: Execute a query
            System.out.println("Creating statement...");
            stmt = conn.createStatement();
            String sql;
            sql = "SELECT * FROM Class";
            ResultSet rs = stmt.executeQuery(sql);

            //process result ResultSet
            while(rs.next()){
                int id = rs.getInt("ID");
                String title = rs.getString("TITLE");
                System.out.println("ID: " + id + "  Title: " + title);
            }
        } catch(SQLException se){
        //Handle errors for JDBC
        se.printStackTrace();
        } catch(Exception e){
        //Handle errors for Class.forName
        e.printStackTrace();
        } finally {
            //finally block used to close resources
            try{ if(stmt!=null) { stmt.close(); } }	catch(SQLException se2){}// nothing we can do
            try{ if(conn!=null) { conn.close(); } }     catch(SQLException se) { se.printStackTrace(); }
        }//end finally try
    }
    
    private static int printMenu(){
        int c = 0;
        System.out.println("\n\n\n");
        String menu = "Menu: \n"+
                "0. Show Menu Again\n"+
                "1. Set or Update the Schedule of Workers (Must be Manager)\n"+
                "2. Set Credit Points per review (Must be Owner)\n"+
                "3. Register Guest\n"+
                "4. Quit\n";
        
        System.out.println(menu);        
        return input.nextInt();
    }
    
    private static void case1(){
        //try catch all?
        //ask for Manager SSN to make sure they control the worker they want to update the schedule for
        
        System.out.println("Manager SSN? : ");
        String managerSSN = input.next();
        while(managerSSN.length() != 9){ 
            System.out.println("SSN not valid! Try again (type 'exit' to go back to menu): ");
            managerSSN = input.next();
            if(managerSSN.equalsIgnoreCase("Exit")){ return; }
        }
        
        //ask for WorkerSSN
        System.out.println("Looking up your staff...");
         
        //look up all the staff that the user commands
        
        try{
            System.out.println("Creating statement...");
            stmt = conn.createStatement();
            String sql = "SELECT ssn,name_ FROM Staff2 WHERE hiredBy="+managerSSN;
            
            ResultSet rs = stmt.executeQuery(sql);

            Map<Integer, String[]> staff = new HashMap<Integer,String[]>(); //index number, [name,ssn]

            //process result ResultSet
            int count = 1;
            while(rs.next()){
                String[] nameSSN = new String[2];
                nameSSN[0] = rs.getString("name_");
                nameSSN[1] = rs.getString("ssn");
                
                staff.put(count,nameSSN);
                System.out.println(Integer.toString(count) + ". Name: "+rs.getString("name_"));
                
                count++;
            }
            
            //System.out.println(staff.get(1)[0]);
            //System.out.println(staff.get(1)[1]);
            
        } catch(SQLException se){
            //Handle errors for JDBC 
            se.printStackTrace();
        } catch(Exception e){
            //Handle errors for Class.forName
            e.printStackTrace();
        } finally {
            //finally block used to close resources
            try{ if(stmt!=null) { stmt.close(); } }	catch(SQLException se2){}// nothing we can do
        }//end finally try
        
    }
    
}//end class