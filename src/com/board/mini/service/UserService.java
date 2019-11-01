package com.board.mini.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import com.board.mini.common.DBCon;
import com.board.mini.common.DBExecutor;

public class UserService {
	public Map<String, Object> doLogin(String id, String pwd){
		Connection con=DBCon.getCon();
		String sql="select * from user_info where ui_id=? and ui_pwd=?";
		DBExecutor dbe=new DBExecutor(); 
		try {
			PreparedStatement ps = dbe.prepared(con, sql);
			ps.setString(1,id);
			ps.setString(2, pwd);
			
			ResultSet rs = dbe.executeQuery();
			if(rs.next()) {
				Map<String, Object> user = new HashMap<>();
				user.put("uiNum", rs.getInt("ui_Num"));
				user.put("uiName", rs.getString("ui_Name"));
				user.put("uiId", rs.getString("ui_id"));
				return user;
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}finally {
			dbe.closeAll();
			DBCon.closeCon();
		}
		return null;
	}
	public Map<String, Object> doSignup(String uiName,String uiId, String uiPwd){
		DBExecutor dbe=new DBExecutor();
		try {
			Connection con=DBCon.getCon();
			String sql="insert into user_info(ui_num,ui_name,ui_id,ui_pwd,credat,cretim,moddat,modtim) ";
			sql+="values(seq_ui_num.nextval,?,?,?,to_char(sysdate,'YYYYMMDD'),to_char(sysdate,'HH24MISS'),to_char(sysdate,'YYYYMMDD'),to_char(sysdate,'HH24MISS')) ";
			
			PreparedStatement ps = dbe.prepared(con,sql);
			ps.setString(1, uiName);
			ps.setString(2, uiId);
			ps.setString(3, uiPwd);
			
			if(ps.executeUpdate()==1){
				Map<String,Object> rMap = new HashMap<String,Object>();
				rMap.put("msg",uiName +"님 회원가입 축하합니다.");
				rMap.put("url","/views/user/login");
				return rMap;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			dbe.closeAll();
			DBCon.closeCon();
		}
		return null;
	}
}
