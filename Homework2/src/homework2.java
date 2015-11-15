//Author: Devanshu Bharel

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
            stmt = conn.createStatement();
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
                        //case1();
                        c = 0;
                        break;
                    case 2:
                        System.out.println("Choice 2");
                        case2();
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
            try{ if(stmt != null) { stmt.close(); } }     catch(SQLException se) { se.printStackTrace(); }
            try{ if(conn != null) { conn.close(); } }     catch(SQLException se) { se.printStackTrace(); }
        }//end finally try    		
    }//end main		


    
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
    
    private static void case3(){
    
    }
    
    //works
    private static void case2(){
        //check to make sure current user is owner, else error out to menu

        //set credit points per review
        //fetch the table
        try{
            System.out.println("Fetching current award points...");
            String fetchMemberType = "SELECT * FROM membertype"; //the table
            ResultSet memberType = stmt.executeQuery(fetchMemberType); //fetches the entire table
            System.out.println("Fetched!");

            int[] creditPts = new int[4];
            
            int c = 0;
            while(memberType.next()){
                String mem = memberType.getString("type_");
                int pts = memberType.getInt("ptsperreview");
                System.out.println("MemberType: "+mem + "\t\tPoints: "+Integer.toString(pts));
                creditPts[c] = pts;
                c++;
            }
            
            System.out.println("Which Member Type would you like to make changes for?\n");
            String chosenMem = input.next();
            
            System.out.println("New Pts Per Review? ");
            int nPts = input.nextInt();
            
            if(chosenMem.equalsIgnoreCase("bronze")){
                if(nPts > creditPts[1] || nPts > creditPts[2]){
                    System.out.println("Bronze can't be given more pts than Silver or Gold!");
                    return;
                }
            } else if(chosenMem.equalsIgnoreCase("silver")){
                if(nPts > creditPts[2] || nPts < creditPts[0]){
                    System.out.println("Silver can't be given more pts Gold or less than Silver!");
                    return;
                }
            } else if(chosenMem.equalsIgnoreCase("gold")){
                if(nPts < creditPts[0] || nPts < creditPts[1]){
                    System.out.println("Gold can't be less than Silver or Bronze");
                    return;
                }
            } else {
                System.out.println("Member type not found!");
                return;
            } //invalid input accounted for
            
            
            //update SQL Table with new pts
            System.out.println("Updating the database...");
            String updateSQL = "UPDATE membertype SET ptsperreview=" + nPts + " WHERE type_='"+chosenMem+"'";
            System.out.println(updateSQL);
            stmt.executeQuery(updateSQL);
            System.out.println("Update Successful!");
        } catch(SQLException se){
            //Handle errors for JDBC 
            se.printStackTrace();
        } catch(Exception e){
            //Handle errors for Class.forName
            e.printStackTrace();
        } finally {
            //finally block used to close resources
        }//end finally try
    
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
            //stmt = conn.createStatement();
            String sql = "SELECT ssn,name_ FROM staff WHERE hiredBy="+managerSSN;
            
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
            
            //Make schedule changes
            int usr = 0;
            while(usr > count || usr <= 0){
                //invailid user count
                System.out.println("What user # would you like to edit?");
                usr = input.nextInt(); 
                
                if(usr < count &&  usr > 0){
                    String[] selectedStaff = staff.get(usr); //[name, ssn]
                    System.out.println("Staff Selected: " + selectedStaff[0]);
                    System.out.println("Update (u) or Set (s) Schedule: ");
                    String setUpdateC = input.next();
                    
                    if(setUpdateC.equalsIgnoreCase("u")){
                        //fetch and list all the schedules of that user
                        //ask for which one needs to be editted
                        //change that and update the db
                        //process result ResultSet
                        
                       String selectedSQL = "SELECT * FROM schedule WHERE staff="+selectedStaff[1]; //returns all schedules of selected worker
                       ResultSet schedules = stmt.executeQuery(selectedSQL);
                       
                       ArrayList<Schedule> sArray = new ArrayList();
                       
                       //print all schedules to allow user to pick what they want to update
                       while(schedules.next()){
                           Timestamp start = schedules.getTimestamp("start_");
                           Timestamp end = schedules.getTimestamp("end_");
                           String type = schedules.getString("type_");
                           String location = schedules.getString("location_");
                           
                           Schedule nSchedule = new Schedule(start,end,type,location);
                           System.out.println(sArray.size()+". "+nSchedule);
                           sArray.add(nSchedule); //size increments now
                        }
                        
                        if(sArray.size() == 0){
                            System.out.println("That staff is NOT currently assigned a working time");
                            return; //return to menu
                        }
                        
                        //else
                        System.out.println("Which day would  you like to update? (Input the # of the entry)");
                        int dayChoice = input.nextInt();
                        Schedule selectedSchedule = sArray.get(dayChoice);
                        
                        System.out.println("You selected the following schedule: " + selectedSchedule);
                        //Start, End, Type, Location
                        Schedule newSchedule = newSchedule();
                        
                        
                        /*
                        schedules.absolute(dayChoice); //sets the cursor to that row
                        
                        Timestamp start = schedules.getTimestamp("start_");
                        Timestamp end = schedules.getTimestamp("end_");
                        String type = schedules.getString("type_");
                        String location = schedules.getString("location_");
                        
                        String startEnd = "Location: " + location+"\n"+
                                   "\t\tStart: " + start + "\t\tEnd" + end+
                                   "\t\tType: "+type;
                        System.out.println("You've Selected This Schedule to Update!" + "\n" + startEnd);
                        */
                    } else if (setUpdateC.equalsIgnoreCase("s")) {
                        //ask for date and time of new schedule
                        //compare time, position, and theatre to make sure there doesn't exist any exiting job
                    } else { return; }//invalid input 
 
                        

                    
                    /*
                    //System.out.println("Fetching schedule...");
                    
                    //fetch user schedule
                    String usrSchedule = "SELECT * FROM schedule WHERE staff="+selectedStaff[1];
                    ResultSet rs2 = stmt.executeQuery(usrSchedule);
                    
                    
                    while(rs2.next()){
                        System.out.println("Start: "+rs2.getTimestamp("START_"));
                        System.out.println("End: "+rs2.getTimestamp("END_"));
                        System.out.println("Type: "+rs2.getString("TYPE_"));
                    }
                    
                    */

                }
                
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
        }//end finally try
        
    }
    
    //for use with case1()
    static Schedule newSchedule(){
        //start year,month,date,hour
        System.out.println("Please Enter in StartTime Year|Month|Date|Hour with '|' seperating the input.");
        String[] nStart = input.next().split("|");
                                        //year,month,date,hour,0,0,0 
        Timestamp start = new Timestamp(
                Integer.parseInt(nStart[0]), //year
                Integer.parseInt(nStart[1]), //month
                Integer.parseInt(nStart[2]), //date
                Integer.parseInt(nStart[3]), //hour
                0,0,0 //minute,second,nanos
        );
        
       
        //end year,month,date,hour
        System.out.println("Please Enter in EndTime Year|Month|Date|Hour with '|' seperating the input.");
        String[] nEnd = input.next().split("|");
                                        //year,month,date,hour,0,0,0 
        Timestamp end = new Timestamp(
                Integer.parseInt(nEnd[0]), //year
                Integer.parseInt(nEnd[1]), //month
                Integer.parseInt(nEnd[2]), //date
                Integer.parseInt(nEnd[3]), //hour
                0,0,0 //minute,second,nanos
        );
        
        
        //type
        System.out.println("What position? "); 
        String type = input.next();
        
        //location
        System.out.println("New Location? ");
        String location = input.next();
        
        Schedule nSchedule = new Schedule(start,end,type,location);
        return nSchedule;
    }
    
}//end class

class Schedule{
    //holds data for a schedule type object
    
    //public String staffSSN;
    public Timestamp start;
    public Timestamp end;
    public String type;
    public String location;
    
    public Schedule(Timestamp s, Timestamp e, String t, String l){
        //staffSSN = ssn;
        start = s;
        end = e;
        type = t;
        location = l;
    }
    
    public String toString(){
        String startEnd = "Location: " + location+"\n"+
                            "\t\tStart: " + start + "\t\tEnd" + end+
                            "\t\tType: "+type;
                
        return startEnd;
    }
    
}

class CreditCardCo{

}
    


/*
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
*/