package util;

import java.sql.*;

public class Util {
	public static Connection getConnection(){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        }catch(ClassNotFoundException e){
            e.printStackTrace();
        }
        String user="root";
        String password="123456";
        String url = "jdbc:mysql://127.0.0.1:3306/zzhair?useSSL=false&serverTimezone=Asia/Shanghai&useUnicode=true&charset=utf-8&characterEncoding=utf-8&autoReconnect=true";
        Connection con=null;
        try{
            con=DriverManager.getConnection(url,user,password);
        }catch(SQLException e){
            e.printStackTrace();
        }
        return con;
    }
	public static void close (Connection con){
        try{
            if(con!=null){
                con.close();
            }
        }catch(SQLException e){
                e.printStackTrace();
            }
    }
 public static void close (PreparedStatement preparedStatement){
        try{
            if(preparedStatement!=null){
                preparedStatement.close();
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
  }
 public static void close(ResultSet resultSet){
        try{
            if(resultSet!=null){
                resultSet.close();
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
   }
	
}
