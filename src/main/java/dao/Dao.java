package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import java.text.SimpleDateFormat;

import util.Util;

public class Dao {
	
	public String getTime() {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        return df.format(new Date());// new Date()为获取当前系统时间
	}
	
	public void addvip(String name,String sex,String phone,String balance,String regdate){
		Connection connection = Util.getConnection();
        PreparedStatement preparedStatement=null; 
        try {
        	String sql = "insert into vips values (?,?,?,?,?)";
            preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setString(1,name);
            preparedStatement.setString(2,sex);
            preparedStatement.setString(3,phone);
            preparedStatement.setString(4,balance);
            preparedStatement.setString(5,regdate);
            preparedStatement.executeUpdate();
        } catch (SQLException  e) {
            e.printStackTrace();
        } finally{
        	Util.close(preparedStatement);
        	Util.close(connection);
        }
	}
	public void addlog(String time,String name,String event,String amount,String phone){
		Connection connection = Util.getConnection();
        PreparedStatement preparedStatement=null; 
        try {
        	String sql = "insert into logs values (?,?,?,?,?)";
            preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setString(1,time);
            preparedStatement.setString(2,name);
            preparedStatement.setString(3,event);
            preparedStatement.setString(4,amount);
            preparedStatement.setString(5,phone);
            preparedStatement.executeUpdate();
        } catch (SQLException  e) {
            e.printStackTrace();
        } finally{
        	Util.close(preparedStatement);
        	Util.close(connection);
        }
	}
	
	
	public void delete(String phone) {
		Connection connection = Util.getConnection();
        PreparedStatement preparedStatement=null; 
        try {
        	String sql = "delete from vips where phone = ?";
        	preparedStatement=connection.prepareStatement(sql);
        	preparedStatement.setString(1,phone);
        	preparedStatement.executeUpdate();
        } catch (SQLException  e) {
            e.printStackTrace();
        } finally{
        	Util.close(preparedStatement);
        	Util.close(connection);
        }
	}
	
	
	public void change(String name,String sex,String phone) {
		Connection connection = Util.getConnection();
        PreparedStatement preparedStatement1=null; 
        PreparedStatement preparedStatement2=null; 
        try {
        	String sql1 = "update vips set name=? ,sex=? where phone=?";
        	String sql2 = "update logs set name=? where phone=?";
        	preparedStatement1=connection.prepareStatement(sql1);
        	preparedStatement2=connection.prepareStatement(sql2);
        	preparedStatement1.setString(1,name);
        	preparedStatement1.setString(2,sex);
        	preparedStatement1.setString(3,phone);
        	preparedStatement2.setString(1,name);
        	preparedStatement2.setString(2,phone);
        	preparedStatement1.executeUpdate();
        	preparedStatement2.executeUpdate();
        } catch (SQLException  e) {
            e.printStackTrace();
        } finally{
        	Util.close(preparedStatement1);
        	Util.close(preparedStatement2);
        	Util.close(connection);
        }
	}
	
	public void updateBalance(String phone,String amount) {
		Connection connection = Util.getConnection();
        PreparedStatement preparedStatement=null; 
        
        Double damount = Double.valueOf(amount);
        Double dnewBalance = getPresentBalance(phone)+damount;
        String newBalance = dnewBalance+"";
       
        try {
        	String sql = "update vips set balance=? where phone=?";
        	preparedStatement=connection.prepareStatement(sql);
        	preparedStatement.setString(1,newBalance);
        	preparedStatement.setString(2,phone);
        	preparedStatement.executeUpdate();
        } catch (SQLException  e) {
            e.printStackTrace();
        } finally{
        	Util.close(preparedStatement);
        	Util.close(connection);
        }
	}
	
	
	public static double getPresentBalance(String phone) {
		Connection connection = Util.getConnection();
        PreparedStatement preparedStatement=null; 
        ResultSet rs=null;
        try {
        	String sql = "select phone,balance from vips";
            preparedStatement=connection.prepareStatement(sql);
            rs=preparedStatement.executeQuery();
            while(rs.next()){
            	if( phone.equals(rs.getObject(1)) )
            		return (double)rs.getObject(2);
            }
        } catch (SQLException  e) {
            e.printStackTrace();
        }finally{
        	Util.close(rs);
        	Util.close(preparedStatement);
        	Util.close(connection);
        }
        return 0;
	}
	
	
	public boolean same(String phone) {
		Connection connection = Util.getConnection();
        PreparedStatement preparedStatement=null; 
        ResultSet rs=null;
        try {
        	String sql = "select phone from vips";
            preparedStatement=connection.prepareStatement(sql);
            rs=preparedStatement.executeQuery();
            while(rs.next()){
            	if( phone.equals(rs.getObject(1)) )
            		return true;
            }
        } catch (SQLException  e) {
            e.printStackTrace();
        }finally{
        	Util.close(rs);
        	Util.close(preparedStatement);
        	Util.close(connection);
        }
        return false;
	}
	

	
	public static void main(String args[]) {
		//Dao dao = new Dao();
		//dao.addvip("张三", "男", "13565624859", "100", dao.getTime());
	}
	
	
	
	
}