<%-- 
    Document   : SQLDataAccess
    Created on : Apr 6, 2023, 2:24:56 PM
    Author     : ADMIN
--%>

<%@page import="java.sql.*"%>


<%!
    public class SQLDataAccess {
	public Connection conn;
	public Statement stm;
	public PreparedStatement ps;
   
    
    private static final String HOST_NAME = "localhost:1433";
    private static final String DATABASE_NAME = "dbCoffeeShop";
    private static final String UserName = "sa";
    private static final String PassWord = "123123Bb";

    public SQLDataAccess() {
        try {         
           // String connectionURL = "jdbc:sqlserver://" + HOST_NAME + ";databaseName=" + DATABASE_NAME+";integratedSecurity=true;encrypt=true;trustServerCertificate=true";
           // Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
          // this.conn=DriverManager.getConnection(connectionURL,UserName,PassWord);
            String IntegratedSecurity = "IntegratedSecurity=true";
            String DriverClass = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
            String DriverURL = "jdbc:sqlserver://AD-PC:1433;databaseName=dbCoffeShop;" + IntegratedSecurity;
            Class.forName(DriverClass);    
            this.conn = DriverManager.getConnection(DriverURL);
            
            this.stm = this.conn.createStatement();

        }
        catch (ClassNotFoundException | SQLException ex) {} 
    }
	
	public ResultSet getResultSet(String SQL) {
		try {
			ResultSet rs;
			rs = this.stm.executeQuery(SQL);
			return rs;
		} catch (SQLException ex) {
		}
		return null;
	}
	
	public ResultSet getResultSet(String SQL, Object[] param) {
		ResultSet rs = null;
		PreparedStatement ps = null;
		try {
			ps = conn.prepareStatement(SQL);
			int i = 1;
			for (Object value : param) {
				ps.setObject(i, value);
				i++;
			}
			rs = ps.executeQuery();
			return rs;
		} catch (SQLException ex) {
			//ex.printStackTrace();
		}
		return null;
	}
	
	// Th?c hi?n Insert, Update, Delete
	public int ExcuteSQL(String SQL) {
		try {
			int k = 0;
			k = this.stm.executeUpdate(SQL);
			return k;
		} catch (SQLException e) {
		}
		return 0;
	}
	
	public int ExecuteSQL(String SQL, Object[] param) {
		try {
			int k = 0;
			PreparedStatement ps = this.conn.prepareStatement(SQL);
			int i = 1;
			for (Object value : param) {
				ps.setObject(i, value);
				i++;
			}
			k = ps.executeUpdate();
			return k;
		} catch (SQLException e) {
		}
		return 0;
	}
	
	public int Execute_StoredProcedure(String NameStoredProcedures, Object[] param) {
		try {
			int k = 0;
			CallableStatement ps = this.conn.prepareCall("{" + NameStoredProcedures + "}");
			int i = 1;
			for (Object value : param) {
				ps.setObject(i, value);
				i++;
			}
			k = ps.executeUpdate();
			return k;
		} catch (SQLException e) {
		}
		return 0;
	}
	
	public ResultSet getResultSet_StoredProcedure(String NameStoredProcedures, Object[] param) {
		ResultSet rs = null;
		PreparedStatement ps = null;
		try {
			ps = conn.prepareCall(NameStoredProcedures);
			if (param != null) {
				int i = 1;
				for (Object value : param) {
					ps.setObject(i, value);
					i++;
				}
			}
			rs = ps.executeQuery();
			return rs;
		} catch (SQLException ex) {
			//ex.printStackTrace();
		}
		return null;
	}
}
%>
