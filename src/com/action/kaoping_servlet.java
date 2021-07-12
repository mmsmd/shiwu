package com.action;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.DB;
import com.orm.TKaoping;
import com.orm.TUser;
import com.util.DateUtils;

public class kaoping_servlet extends HttpServlet
{
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	{
        String type=req.getParameter("type");
		
		if(type.endsWith("kaopingAdd"))
		{
			kaopingAdd(req, res);
		}
		if(type.endsWith("kaopingMana"))
		{
			kaopingMana(req, res);
		}
		if(type.endsWith("kaopingMe"))
		{
			kaopingMe(req, res);
		}
	}
	
	public void kaopingAdd(HttpServletRequest req,HttpServletResponse res)
	{
		String user_id=req.getParameter("user_id");
		String shijian=DateUtils.formatDate2Str(new Date(), "yyyy-MM-dd");
		String fenshu=req.getParameter("fenshu");
		String shuoming=req.getParameter("shuoming");
		
		String sql="insert into t_kaoping (user_id,shijian,fenshu,shuoming)" +
				   "values(?,?,?,?)";
		Object[] params={user_id,shijian,fenshu,shuoming};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "kaoping?type=kaopingMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	
	public void kaopingMana(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String sql="select ta.*,tc.xingming,tc.banji,tc.lianxi,tc.type " +
				  "from t_kaoping ta,t_user tc where ta.user_id=tc.id";
		
		req.setAttribute("kaopingList", gethuodongList(sql));
		req.getRequestDispatcher("admin/kaoping/kaopingMana.jsp").forward(req, res);
	}
	
	public void kaopingMe(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		TUser user = (TUser)req.getSession().getAttribute("user");
		String sql="select ta.*,tc.xingming,tc.banji,tc.lianxi,tc.type " +
				   "from t_kaoping ta,t_user tc where ta.user_id=tc.id and ta.user_id="+user.getId();
		
		req.setAttribute("kaopingList", gethuodongList(sql));
		req.getRequestDispatcher("admin/kaoping/kaopingMe.jsp").forward(req, res);
	}
	
	private List gethuodongList(String sql)
	{
		List kaopingList=new ArrayList();
		
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				TKaoping kaoping=new TKaoping();
				
				kaoping.setId(rs.getInt("id"));
				kaoping.setShijian(rs.getString("shijian"));
				kaoping.setFenshu(rs.getString("fenshu"));
				kaoping.setShuoming(rs.getString("shuoming"));
				
				kaoping.setXingming(rs.getString("xingming"));
				kaoping.setBanji(rs.getString("banji"));
				kaoping.setLianxi(rs.getString("lianxi"));
				kaoping.setType(rs.getString("type"));
				kaopingList.add(kaoping);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();		
		
		return kaopingList;
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
