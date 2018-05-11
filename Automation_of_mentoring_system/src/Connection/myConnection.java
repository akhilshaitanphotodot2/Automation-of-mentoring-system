package Connection;
import java.sql.Connection;
import java.sql.DriverManager;

public class myConnection 
{
	static Connection con;
	static
	{
		try
		{
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/automation","root","07/35452");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public static Connection getConnection()
	{
		return con;
	}
}
