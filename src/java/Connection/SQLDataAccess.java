package Connection;



import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

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
            //String connectionURL = "jdbc:sqlserver://" + HOST_NAME + ";databaseName=" + DATABASE_NAME;
            //Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
           //this.conn=DriverManager.getConnection(connectionURL,UserName,PassWord)
            String IntegratedSecurity = "IntegratedSecurity=true";
            String DriverClass = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
            String DriverURL = "jdbc:sqlserver://SONTRUNG:1433;databaseName=dbCoffeeShop;" + IntegratedSecurity;
            Class.forName(DriverClass);    
            this.conn = DriverManager.getConnection(DriverURL);
             System.out.println("Kết nối thành công");
            
            this.stm = this.conn.createStatement();

        }
        catch (ClassNotFoundException | SQLException ex) {
            System.out.println("Lỗi kết nối: "+ex.getMessage());
        } 
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
			ex.printStackTrace();
		}
		return null;
	}
	
	// Thực hiện Insert, Update, Delete
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
			ex.printStackTrace();
		}
		return null;
	}
        public static void main(String[] args) {
            SQLDataAccess test = new SQLDataAccess();
            ResultSet rs = test.getResultSet("select * from tbSANPHAM");
            try {
                rs.next();
                System.out.println(rs.getString(2));
            } catch (Exception e) {
            }

            
    }
}
