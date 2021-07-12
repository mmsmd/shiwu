package com.action;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.DB;
import com.orm.TBumen;
import com.orm.TUser;

public class user_servlet extends HttpServlet
{
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	{
        String type=req.getParameter("type");
		
        if(type.endsWith("userAdd"))
        {
        	userAdd(req, res);
        }
		if(type.endsWith("userToAdd"))
		{
			userToAdd(req, res);
		}
		if(type.endsWith("userUpd"))
		{
			userUpd(req, res);
		}
		if(type.endsWith("userMana"))
		{
			userMana(req, res);
		}
		if(type.endsWith("userSele"))
		{
			userSele(req, res);
		}
		if(type.endsWith("userList"))
		{
			userList(req, res);
		}
		if(type.endsWith("userDel"))
		{
			userDel(req, res);
		}
		if(type.endsWith("userToUpd"))
		{
			userToUpd(req, res);
		}
	}
	//用户添加
	public void userAdd(HttpServletRequest req,HttpServletResponse res)
	{
		String loginname=req.getParameter("loginname");
		String loginpw=req.getParameter("loginpw");
		String bumen=req.getParameter("bumen");
		String xingming=req.getParameter("xingming");
		String xingbie=req.getParameter("xingbie");
		String banji=req.getParameter("banji");
		String lianxi=req.getParameter("lianxi");
		String qq=req.getParameter("qq");
		String type=req.getParameter("userType");
		String del="no";
		
		String sql="insert into t_user (loginname,loginpw,bumen_id,xingming,xingbie,banji,lianxi,qq,type,del)" +
				   "values(?,?,?,?,?,?,?,?,?,?)";
		Object[] params={loginname,loginpw,bumen,xingming,xingbie,banji,lianxi,qq,type,del};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "user?type=userMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}

	//修改用户个人信息
	public void userUpd(HttpServletRequest req,HttpServletResponse res)
	{
		String id=req.getParameter("id");
		String loginpw=req.getParameter("loginpw");
		String xingming=req.getParameter("xingming");
		String xingbie=req.getParameter("xingbie");
		String lianxi=req.getParameter("lianxi");
		String qq=req.getParameter("qq");
		
		String sql="update t_user set loginpw=?,xingming=?,xingbie=?,lianxi=?,qq=? where id=?";
		Object[] params={loginpw,xingming,xingbie,lianxi,qq,id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "user?type=userToUpd");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	
	//用户删除
	public void userDel(HttpServletRequest req,HttpServletResponse res)
	{
		String id=req.getParameter("id");
		
		String sql="update t_user set del='yes' where id=?";
		Object[] params={id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "user?type=userMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	
	public void userToAdd(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		req.setAttribute("bumenList", getBumenList());
		req.getRequestDispatcher("admin/user/userAdd.jsp").forward(req, res);
	}
	
	public void userMana(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String sql="select ta.*,tb.mingcheng from t_user ta,t_bumen tb " +
				   "where ta.bumen_id=tb.id and ta.del='no'";
		
		req.setAttribute("userList", getUserList(sql));
		req.getRequestDispatcher("admin/user/userMana.jsp").forward(req, res);
	}
	public void userList(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String sql="select ta.*,tb.mingcheng from t_user ta,t_bumen tb " +
		   		   "where ta.bumen_id=tb.id and ta.del='no' and type=2";
		
		req.setAttribute("userList", getUserList(sql));
		req.getRequestDispatcher("admin/kaoping/userList.jsp").forward(req, res);
	}

	public void userSele(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String huodong_id = req.getParameter("id");
		String sql="select ta.*,tb.mingcheng from t_user ta,t_bumen tb " +
		   		   "where ta.bumen_id=tb.id and ta.del='no' and ta.id not in " +
				   "(select user_id from t_hdry where huodong_id="+huodong_id+")";
		
		req.setAttribute("userList", getUserList(sql));
		req.getRequestDispatcher("admin/user/userSele.jsp").forward(req, res);
	}
	
	public void userToUpd(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		TUser user = (TUser)req.getSession().getAttribute("user");
		
		String sql="select * from t_user ta,t_bumen tb " +
		   		   "where ta.bumen_id=tb.id and ta.id="+user.getId();
		
		req.setAttribute("user", (TUser)getUserList(sql).get(0));
		req.getRequestDispatcher("admin/user/userEditPre.jsp").forward(req, res);
	}
	
	private List getUserList(String sql)
	{
		List userList=new ArrayList();
		
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				TUser user=new TUser();
				
				user.setId(rs.getString("id"));
				user.setLoginname(rs.getString("loginname"));
				user.setLoginpw(rs.getString("loginpw"));
				user.setXingming(rs.getString("xingming"));
				user.setXingbie(rs.getString("xingbie"));
				user.setBanji(rs.getString("banji"));
				user.setLianxi(rs.getString("lianxi"));
				user.setQq(rs.getString("qq"));
				user.setType(rs.getString("type"));
				
				user.setBmmc(rs.getString("mingcheng"));
				userList.add(user);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();		
		
		return userList;
	}
	
	private List getBumenList()
	{
		List bumenList=new ArrayList();
		String sql="select * from t_bumen where del='no'";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				TBumen bumen=new TBumen();
				bumen.setId(rs.getInt("id"));
				bumen.setMingcheng(rs.getString("mingcheng"));
				bumenList.add(bumen);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		return bumenList;
	}
	public void dispatch(String targetURI,HttpServletRequest request,HttpServletResponse response) 
	{
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher(targetURI);
		try 
		{
		    dispatch.forward(request, response);
		    return;
		} 
		catch (ServletException e) 
		{
                    e.printStackTrace();
		} 
		catch (IOException e) 
		{
			
		    e.printStackTrace();
		}
	}
	public void init(ServletConfig config) throws ServletException 
	{
		super.init(config);
	}
	
	public void destroy() 
	{
		
	}
}
