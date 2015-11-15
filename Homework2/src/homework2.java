//Author: Devanshu Bharel

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
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
                    case 0: // System.out.println("Choice 0");
                        c = printMenu();
                        break;
                    case 1: // System.out.println("Choice 1");
                        case1();
                        c = 0;
                        break;
                    case 2: // System.out.println("Choice 2");
                        case2();
                        c = 0;
                        break;
                    case 3: // System.out.println("Choice 3");
                        case3();
                        c = 0;
                        break;
                    case 4: // System.out.println("Choice 4");
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
    
    //works
    private static void case3(){
        /*
        6. Write the program that will allow a guest to be registered for the first time. 
        The program prevents the guest from purchasing a ticket if the guest has not entered 
        his credit card information or his credit card does not have sufficient funds. 
        Write the CreditCardCo test object that allows you to test this program.
        */
        
        CreditCardCo ccCompany = new CreditCardCo();
        
        System.out.println("Registering New Guest! Please input the email: ");
        String guestEmail = input.next(); //check to make sure xx@xx.com in webapp
        
        System.out.println("What is First Name?: ");
        String guestFirst = input.next();
        
        System.out.println("What is Last Name?: ");
        String guestLast = input.next();
        
        System.out.println("What is your phonenumber?: ");
        String guestPhoneNum = input.next();
        
        System.out.println("What is their CC number?");
        int guestCCNum = input.nextInt();
        
        System.out.println("What location would you like to view the movie at?: ");
        String theatreLoc = input.next();
        
        System.out.println("What is the price of the movie they wish to see?: ");
        double moviePrice = input.nextDouble();
        
        //make sure valid cc card
        while(ccCompany.getBalance(guestCCNum) == -1){
            System.out.println("Credit Card Number does not exist with Credit Card Company! ");
            System.out.println("Renenter CC Num '0' to exit");
            guestCCNum = input.nextInt();
            if(guestCCNum == 0){ return; } //exits to menu
            
        }
        
        //check to make sure they can afford it
        if(moviePrice > ccCompany.getBalance(guestCCNum)){
            System.out.println("Insufficient Funds on Credit Card!");
            System.out.println("You have: $" + ccCompany.getBalance(guestCCNum));
            System.out.println("You need: $"+ moviePrice);
            return; //exit to menu
        }
        
        System.out.println("Everything seems to be in order, adding entree and charging your CC..");
        ccCompany.chargeCard(guestCCNum, moviePrice);
        String insertGuest = "INSERT INTO user_ VALUES("+
                "'" + guestEmail + "'," +
                "'" + guestCCNum + "'," +
                "'" + guestPhoneNum + "'," +
                "'" + guestFirst + "'," +
                "'" + guestLast + "'," +
                "'guest'"+ //type
                ")";
        
        String insertGuestLoc = "INSERT INTO guestinfo VALUES("+
                "'" + guestEmail + "',"+
                "'" + theatreLoc + "'" + ")";
        
        try{
            stmt.executeQuery(insertGuest);
            stmt.executeQuery(insertGuestLoc);
            System.out.println("Successfully inserted newguest!");
            
        } catch(SQLException se){
            se.printStackTrace();
        } catch(Exception e){
            //Handle errors for Class.forName
            e.printStackTrace();
        }
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
        } 
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
            
            if(count == 1) {
                System.out.println("No workers were hired by you!");
                return;
            }
            
            
            //select worker to mess with
            System.out.println("What user# would you like to edit?");
            int usr = input.nextInt();
            
            if(usr<=0 || usr>count){ 
                System.out.println("Invalid Input!");
                return;
            }
            
            //usr selected
            //ask if update or add new schedule
            String[] selectedStaff = staff.get(usr); //[name, ssn]
            System.out.println("Staff Selected: " + selectedStaff[0]);
            
            System.out.println("Update(u) or Add(a) or Delete (d) Schedule Changes: ");
            String choice = input.next();
            
            if(choice.equalsIgnoreCase("a")){
                //new Schedule(selected staff ssn, new start, new end, type, location)

                //start,end,type,location
                
                //year,month,date,hour,0,0,0
                System.out.println("New Start Time(Year|Month|Date|Hour): ");
                String[] nSArray = input.next().split("|");
                Timestamp newStart = new Timestamp(
                        Integer.parseInt(nSArray[0]), //year
                        Integer.parseInt(nSArray[1]), //month
                        Integer.parseInt(nSArray[2]), //date
                        Integer.parseInt(nSArray[3]), //hour
                        0,0,0); //minute, seconds, nanos
                
                
                //year,month,date,hour,0,0,0
                System.out.println("New End Time(Year|Month|Date|Hour): ");
                String[] nEArray = input.next().split("|");
                Timestamp newEnd = new Timestamp(
                        Integer.parseInt(nEArray[0]), //year
                        Integer.parseInt(nEArray[1]), //month
                        Integer.parseInt(nEArray[2]), //date
                        Integer.parseInt(nEArray[3]),
                        0,0,0); //minute, seconds, nanos
                
                System.out.println("New Type: ");
                String newType = input.next();
                
                System.out.println("New Location: ");
                String nLocation = input.next();
                
                String getShifts = "SELECT start_,end_ FROM schedule WHERE type='"
                        +newType+"' AND location='"+nLocation+"'";
                
                ResultSet shifts = stmt.executeQuery(getShifts); //gets shifts for that location for that job
                
                //check to make sure no conflicts
                //working with newStart,newEnd Timestamp objects
                //1. newStart < newEnd
                
                if(newStart.after(newEnd) || newStart.equals(newEnd)){
                    System.out.println("Invalid Start/End Times");
                    return; //return to menu
                }
                
                //check for the following bounds
                //2. givenEnd <= newStart < givenStart
                //3. givenEnd < newStart <= Start
                
                while(shifts.next()){
                    Timestamp givenStart = shifts.getTimestamp("start_");
                    Timestamp givenEnd = shifts.getTimestamp("end_");
                    
                    if
                    (   
                        ( //if start within a given bounds
                            (newStart.after(givenStart) || newStart.equals(givenStart)) &&
                            (newStart.before(newEnd))
                        )
                            || 
                        ( //if end within a given bounds
                            (newEnd.after(givenStart)) && 
                            (newEnd.before(givenEnd) || newEnd.equals(givenEnd))
                        ) 
                    ){
                        System.out.println("There is a scheduling conflict");
                        return;
                    }
                    
                } //end while
                
                //no conflicts encountered
                //add new shift
                String addShift = "INSERT INTO schedule VALUES=("+
                        "'" + selectedStaff[1] + "'" + "," +
                        newStart + "," +
                        newEnd + "," +
                        "'"+newType+"'"+","+
                        "'"+nLocation+"'"+","+
                        ")";
               
                System.out.println("Adding Shift...");
                stmt.executeQuery(addShift);
                System.out.println("Shift Added!");
                
            } else if(choice.equalsIgnoreCase("d")) {
                //print all shifts of worker
                //ask for selection
                //delete given row
                String fetchShifts = "SELECT * FROM schedule WHERE ssn="+selectedStaff[1];
                ResultSet workerShifts = stmt.executeQuery(fetchShifts);
                
                int c = 1;
                while(workerShifts.next()){
                    System.out.println(c+". Type: " + workerShifts.getString("type_")+
                            "\nLocation: " + workerShifts.getString("location_") +
                            "\nStart: " + workerShifts.getTimestamp("start_")+
                            "\nEnd: " + workerShifts.getTimestamp("end_"));
                }
                
                System.out.println("Which schedule would you like to drop? (-1) to quit: ");
                int dropChoice = input.nextInt();
                if(dropChoice == -1) {return;}
                
                //set cursor to that row
                workerShifts.absolute(dropChoice);
                String dropStatement = "DELETE FROM schedule WHERE"+
                        " ssn="     +selectedStaff[1]+
                        " start_="  +workerShifts.getTimestamp("start_")+
                        " end_="    +workerShifts.getTimestamp("end_")+
                        " type_="   +workerShifts.getString("type_")+
                        " location_="+workerShifts.getString("location_");
                System.out.println("Deleting row...");
                stmt.executeQuery(dropStatement);
                System.out.println("Successfully deleted row!");
                
            } else if(choice.equalsIgnoreCase("u")){
                //print all the results
                //select which to update
                //check conflicts, ignore the row that's the same as the update row
                //if no conflicts, then update row with new start,end times
                
                String fetchShifts = "SELECT * FROM schedule WHERE ssn="+selectedStaff[1];
                ResultSet workerShifts = stmt.executeQuery(fetchShifts);
                
                int c = 0;
                while(workerShifts.next()){
                    System.out.println(c+". Type: " + workerShifts.getString("type_")+
                            "\nLocation: " + workerShifts.getString("location_") +
                            "\nStart: " + workerShifts.getTimestamp("start_")+
                            "\nEnd: " + workerShifts.getTimestamp("end_"));
                }
                
                System.out.println("Which schedule would you like to update? (-1) to quit: ");
                int upChoice = input.nextInt();                    
                
                if(upChoice == -1){return;}
                
                //store selected row
                workerShifts.absolute(upChoice);
                //ssn = selectedStaff[1]
                Timestamp oldStart  = workerShifts.getTimestamp("start_");
                Timestamp oldEnd    = workerShifts.getTimestamp("end_");
                String    oldType   = workerShifts.getString("type_");
                String    oldLoc    = workerShifts.getString("loctation_");
                
                System.out.println("Chosen: \n");
                System.out.println(upChoice+". Type: " + workerShifts.getString("type_")+
                            "\nLocation: " + workerShifts.getString("location_") +
                            "\nStart: " + workerShifts.getTimestamp("start_")+
                            "\nEnd: " + workerShifts.getTimestamp("end_"));
                
                //ask for new start,end
                //year,month,date,hour,0,0,0
                System.out.println("New Start Time(Year|Month|Date|Hour): ");
                String[] nSArray = input.next().split("|");
                Timestamp newStart = new Timestamp(
                        Integer.parseInt(nSArray[0]), //year
                        Integer.parseInt(nSArray[1]), //month
                        Integer.parseInt(nSArray[2]), //date
                        Integer.parseInt(nSArray[3]), //hour
                        0,0,0); //minute, seconds, nanos
                
                
                //year,month,date,hour,0,0,0
                System.out.println("New End Time(Year|Month|Date|Hour): ");
                String[] nEArray = input.next().split("|");
                Timestamp newEnd = new Timestamp(
                        Integer.parseInt(nEArray[0]), //year
                        Integer.parseInt(nEArray[1]), //month
                        Integer.parseInt(nEArray[2]), //date
                        Integer.parseInt(nEArray[3]),
                        0,0,0); //minute, seconds, nanos
                
                //check to make sure start doesn't occus after end
                if(newStart.after(newEnd) || newStart.equals(newEnd)){
                    System.out.println("Invalid Start/End Times");
                    return; //return to menu
                }
                
                //check conflicts
                workerShifts.absolute(0);
                
                while(workerShifts.next()){
                    Timestamp givenStart = workerShifts.getTimestamp("start_");
                    Timestamp givenEnd = workerShifts.getTimestamp("end_");
                    
                    if  (oldStart.equals(givenStart) &&
                         oldEnd.equals(givenEnd) &&
                         oldType.equals(workerShifts.getString("type_")) &&
                         oldLoc.equals(workerShifts.getString("location_"))
                        ){} //ignore as this is the same row as selected
                    
                    
                    else if
                    (   
                        ( //if start within a given bounds
                            (newStart.after(givenStart) || newStart.equals(givenStart)) &&
                            (newStart.before(newEnd))
                        )
                            || 
                        ( //if end within a given bounds
                            (newEnd.after(givenStart)) && 
                            (newEnd.before(givenEnd) || newEnd.equals(givenEnd))
                        ) 
                    ){
                        System.out.println("There is a scheduling conflict");
                        return;
                    }
                    
                } //end while
                
                //no scheduling conflict
                String updateStmt = "UPDATE schedule SET start_="+newStart+
                        " , end_="+newEnd+" WHERE"+
                        " ssn="+selectedStaff[1]+
                        " type='"+oldType+"' ,"+
                        " location_='"+oldLoc+"' ,"+
                        " start_="+oldStart+
                        " end_="+oldEnd;
                System.out.println("Updating db...");
                System.out.println(updateStmt);
                
                stmt.executeQuery(updateStmt);
                System.out.println("Sucessfully updated!");     
                        
                
            } else {
                System.out.println("Bad Input");
                return;
            }
            
        } catch(SQLException se){
            //Handle errors for JDBC 
            se.printStackTrace();
        } catch(Exception e){
            //Handle errors for Class.forName
            e.printStackTrace();
        } 
        
    }
    
}//end class


class CreditCardCo{
    static Map<Integer, Double> ccDB = new HashMap<Integer,Double>(); //cc num, balance

    public CreditCardCo(){
        //sample data
        ccDB.put(110111,45.00);
        ccDB.put(110222,500.45);
        ccDB.put(111111,0.00);
        ccDB.put(005522,10.00);
    }
    
    public double getBalance(int creditCardNum){
        if(ccDB.containsKey(creditCardNum)){
            return ccDB.get(creditCardNum);
        } else {
            return -1; //credit card number doesn't exist
        }
    }
    
    public void chargeCard(int cc, double chargeAmount){
        ccDB.replace(cc, chargeAmount);
    }
}



