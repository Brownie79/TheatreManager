import java.sql.*;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

public class SQLConn {
    // JDBC driver name and database URL
    static final String JDBC_DRIVER = "oracle.jdbc.OracleDriver";  
    static final String DB_URL = "jdbc:oracle:thin:@fourier.cs.iit.edu:1521:orcl";

    // Database credentials
    static final String USER = "wmei1";
    static final String PASS = "9681868";
    
    //Database Conn & Statement
    static Connection conn = null;
    static Statement stmt = null;
    
    public SQLConn(){
        try{
            //STEP 2: Register JDBC driver
            Class.forName(JDBC_DRIVER);

            //STEP 3: Open a connection
            System.out.println("Connecting to database...");
            conn = DriverManager.getConnection(DB_URL,USER,PASS);
            stmt = conn.createStatement();
            System.out.println("Succesfully Connected!");
            
        } catch(SQLException se){
            //Handle errors for JDBC
            se.printStackTrace();
        } catch(Exception e){
            //Handle errors for Class.forName
            e.printStackTrace();
        } finally {
            //finally block used to close resources
            //try{ if(stmt != null) { stmt.close(); } }     catch(SQLException se) { se.printStackTrace(); }
            //try{ if(conn != null) { conn.close(); } }     catch(SQLException se) { se.printStackTrace(); }
        }//end finally try    		
    }
    
    public String getColNames(String tableName){
        String colNames = "";
        
        try{
            String sql = "SELECT * FROM "+tableName;
            ResultSet tuples= stmt.executeQuery(sql); //fetches the entire table
            //System.out.println("Fetched All Tuples of table: " + tableName);
            int colCount = tuples.getMetaData().getColumnCount(); //amount of columns 
            
            for(int i = 1; i<=colCount;i++){
                colNames = colNames +"   |   "+ tuples.getMetaData().getColumnName(i);
            
            }
            
        } catch(SQLException se){
            //Handle errors for JDBC
            System.out.println("Table Not Found!");
            se.printStackTrace();
        }
        
        return colNames;
    }
    
    public ArrayList<String> getAllTableValues(String tableName){
        try{
            String sql = "SELECT * FROM "+tableName;
            ResultSet tuples= stmt.executeQuery(sql); //fetches the entire table
            System.out.println("Fetched All Tuples of table: " + tableName);
            
            //return tuples;
            /*
            //find how many rows are returned to use to make a string array
            int tuplesCount = 0;
            if(tuples.last()){
                tuplesCount = tuples.getRow();
                tuples.beforeFirst(); //reset the tuples result set to the begining for processing
            } else {    System.out.println("Empty Array Set?");     }
            */
            
            int colCount = tuples.getMetaData().getColumnCount(); //amount of columns 
            
            //String[] strTuples = new String[tuplesCount];
            ArrayList<String> strTuples = new ArrayList();
            while(tuples.next()){
                String newTuple = new String();
                for(int i=1; i<=colCount ;i++){
                   String colType = tuples.getMetaData().getColumnTypeName(i);
                   //System.out.println("Coloumn Type: " + colType);
                   String newPart;
                   
                   //formatter to deal with "date" types
                   Format dateFormatter = new SimpleDateFormat("dd/MM/yyyy");
                   
                   switch (colType){
                        case "VARCHAR":
                        case "VARCHAR2":
                            newPart = tuples.getString(i);
                            break;
                        case "NUMBER":
                            newPart = Integer.toString(tuples.getInt(i));
                            break;
                        case "DATE":
                            newPart = dateFormatter.format(tuples.getDate(i));
                            break;
                        default:
                            newPart = "colType: " + colType;
                            
                   } 
                    
                   //String newPart = (String) tuples.getObject(i);
                   //System.out.println(newPart);
                   newTuple = newTuple + "  |   " + newPart;
                }
                //System.out.println(newTuple);
                strTuples.add(newTuple);
            }
            
            System.out.println(strTuples);
            return strTuples;
        }catch(SQLException se){
            //Handle errors for JDBC
            System.out.println("Table Not Found!");
            se.printStackTrace();
        } 
        
        //should never return null, but instead just error out. 
        //java insists on a return anyway so here it is
        
        return new ArrayList();
    }
    
}
