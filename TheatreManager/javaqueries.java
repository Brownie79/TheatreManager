// good
    public String query1(String threadType, int threadID) {
        try{
            String sql = "SELECT THREADID, USER_, CONTENT_"+
                         "FROM (SELECT * FROM ? WHERE ? IN THREADID ORDER BY ID DESC)"+
                         "WHERE ROWNUM <= 3";
            
            pStmt.setString(1, threadType); //MOVIERESPONSES OR THEATRERESPONSES
            pStmt.setInt(2, threadID); // 1-6
            ResultSet data = pStmt.executeQuery(sql);
            
            String output = "";
            while(data.next()){
                output = output+"\n"+data.getString("THREADID")+" | "+data.getString("USER_")+" | "+data.getString("CONTENT_");
            }
            
            return output;
        }catch(SQLException e){e.printStackTrace();}
        return -1;
    }
    
    // good
    public String query2() {
        try{
            String sql = "SELECT THREADID, USER_, CONTENT_ " +
"FROM (SELECT * FROM (SELECT * FROM MOVIERESPONSES " +
"                     UNION " +
"                     SELECT * FROM THEATRERESPONSES) " +
"      ORDER BY ID DESC) " +
"WHERE ROWNUM <= 3";
            
            //pStmt.setString(1, threadType); //MOVIERESPONSES OR THEATRERESPONSES
            //pStmt.setInt(2, threadID); // 1-6
            ResultSet data = pStmt.executeQuery(sql);
            
            String output = "";
            while(data.next()){
                output = output+"\n"+data.getString("THREADID")+" | "+data.getString("USER_")+" | "+data.getString("CONTENT_");
            }
            
            return output;
        }catch(SQLException e){e.printStackTrace();}
        return -1;
    }
    
    
    public String query3() {
        try{
            String sql = "SELECT content_, hits\n" +
"FROM(\n" +
"    Select content_, hits \n" +
"    FROM moviethread \n" +
"    union \n" +
"    select content_, hits \n" +
"    FROM theatrethread) \n" +
"where hits = (SELECT MAX(Hits)\n" +
"              FROM(\n" +
"                  Select content_, hits \n" +
"                  FROM moviethread \n" +
"                  union \n" +
"                  select content_, hits \n" +
"                  FROM theatrethread))";
            
            ResultSet data = pStmt.executeQuery(sql);
            
            String output = "";
            while(data.next()){
                output = output+"\n"+data.getString("CONTENT_")+" | "+data.getString("HITS");
            }
            
            return output;
        }catch(SQLException e){e.printStackTrace();}
        return -1;
    }
    
    public String query5() {
        try{
            String sql = "SELECT user_, counter\n" +
"FROM\n" +
"	(SELECT user_, count(*) as counter\n" +
"	FROM(\n" +
"		SELECT user_, content_ \n" +
"		FROM theatreresponses\n" +
"		union\n" +
"		select user_, content_\n" +
"		From movieresponses)\n" +
"		GROUP BY user_)\n" +
"where counter = (SELECT MAX(COUNT(*))\n" +
"                  FROM (SELECT user_, content_ \n" +
"                  FROM theatreresponses\n" +
"                  union\n" +
"                  select user_, content_\n" +
"                  From movieresponses)\n" +
"                  GROUP BY user_\n" +
"                  )";
            
            ResultSet data = pStmt.executeQuery(sql);
            
            String output = "";
            while(data.next()){
                output = output+"\n"+data.getString("USER_")+" | "+data.getString("COUNTER");
            }
            
            return output;
        }catch(SQLException e){e.printStackTrace();}
        return -1;
    }
    
    public String query6() {
         try{
            String sql = "SELECT Theatre, counter\n" +
"FROM (SELECT Theatre, COUNT(UNIQUE MOVIE) AS counter\n" +
"      FROM MOVIETIMES\n" +
"      GROUP BY Theatre)\n" +
"WHERE counter = (SELECT MAX(COUNT(UNIQUE MOVIE))\n" +
"                 FROM MOVIETIMES\n" +
"                 GROUP BY Theatre)";
            
            ResultSet data = pStmt.executeQuery(sql);
            
            String output = "";
            while(data.next()){
                output = output+"\n"+data.getString("THEATRE")+" | "+data.getString("COUNTER");
            }
            
            return output;
        }catch(SQLException e){e.printStackTrace();}
        return -1;
    }
    
    public String query7() {
        try{
            String sql = "SELECT ADDRESS, ZIP, OWNER_\n" +
"FROM (SELECT * FROM THEATRE ORDER BY SALES DESC)\n" +
"WHERE ROWNUM = 1";
            
            ResultSet data = pStmt.executeQuery(sql);
            
            String output = "";
            while(data.next()){
                output = output+"\n"+data.getString("ADDRESS")+" | "+data.getString("ZIP")+" | "+data.getString("OWNER_");
            }
            
            return output;
        }catch(SQLException e){e.printStackTrace();}
        return -1;
    }
    
    public String query8(String location) {
        try{
            String sql = "SELECT NAME_, newType, START_, END_\n" +
"FROM (SELECT NAME_, newType, newLocation, START_, END_, DATE_\n" +
"      FROM (SELECT TYPE_ as newType, location_ as newLocation, DATE_, START_, END_, SSN\n" +
"            FROM SCHEDULE) S1\n" +
"      INNER JOIN STAFF\n" +
"      ON S1.SSN = STAFF.SSN)\n" +
"WHERE newLocation = ? -- The location is specified by the user\n" +
"      AND DATE_ = '14-DEC-15' -- next monday date or current date (in which case the current day is Monday)\n" +
"ORDER BY START_ ASC";
            
            pStmt.setString(1, location);
            ResultSet data = pStmt.executeQuery(sql);
            
            String output = "";
            while(data.next()){
                output = output+"\n"+data.getString("NAME_")+" | "+data.getString("newType")+" | "+data.getString("START_")+" | "+data.getString("END_");
            }
            
            return output;
        }catch(SQLException e){e.printStackTrace();}
        return -1;
    }
    
    public String query9() {
        try{
            String sql = 
"SELECT COUNT(*) as COUNT\n" +
"FROM SCHEDULE\n" +
"WHERE TYPE_ = 'Security'\n" +
"      AND DATE_ = '10-DEC-15'";
            
            ResultSet data = pStmt.executeQuery(sql);
            
            String output = "";
            while(data.next()){
                output = "Janitors working tomorrow: "+data.getString("COUNT");
            }
            
            return output;
        }catch(SQLException e){e.printStackTrace();}
        return -1;
    }
