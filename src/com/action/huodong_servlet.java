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
import com.orm.THuodong;

public class huodong_servlet extends HttpServlet
{
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	{
        String type=req.getParameter("type");
		
		if(type.endsWith("huodongAdd"))
		{
			huodongAdd(req, res);
		}
		if(type.endsWith("huodongUpd"))
		{
			huodongUpd(req, res);
		}
		if(type.endsWith("huodongMana"))
		{
			huodongMana(req, res);
		}
		if(type.endsWith("huodongList"))
		{
			huodongList(req, res);
		}
		if(type.endsWith("huodongQuery"))
		{
			huodongQuery(req, res);
		}
		if(type.endsWith("huodongDel"))
		{
			huodongDel(req, res);
		}
	}
	
	public void huodongAdd(HttpServletRequest req,HttpServletResponse res)
	{
		String mingcheng=req.getParameter("mingcheng");
		String shijian=req.getParameter("shijian");
		String didian=req.getParameter("didian");
		String neirong=req.getParameter("neirong");
		String del="no";
		
		String sql="insert into t_huodong (mingcheng,shijian,didian,neirong,del)" +
				   "values(?,?,?,?,?)";
		Object[] params={mingcheng,shijian,didian,neirong,del};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "huodong?type=huodongMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	
	public void huodongUpd(HttpServletRequest req,HttpServletResponse res)
	{
		String id=req.getParameter("id");
		String mingcheng=req.getParameter("mingcheng");
		String shijian=req.getParameter("shijian");
		String didian=req.getParameter("didian");
		String neirong=req.getParameter("neirong");
		
		String sql="update t_huodong set mingcheng=?,shijian=?,didian=?,neirong=? where id=?";
		Object[] params={mingcheng,shijian,didian,neirong,id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "huodong?type=huodongMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	
	public void huodongDel(HttpServletRequest req,HttpServletResponse res)
	{
		String id=req.getParameter("id");
		
		String sql="update t_huodong set del='yes' where id=?";
		Object[] params={id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "huodong?type=huodongMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	
	public void huodongMana(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String sql="select * from t_huodong where del='no'";
		
		req.setAttribute("huodongList", gethuodongList(sql));
		req.getRequestDispatcher("admin/huodong/huodongMana.jsp").forward(req, res);
	}
	
	public void huodongList(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String sql="select * from t_huodong where del='no'";
		
		req.setAttribute("huodongList", gethuodongList(sql));
		req.getRequestDispatcher("admin/renyuan/huodongList.jsp").forward(req, res);
	}
	
	public void huodongQuery(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String sql="select * from t_huodong where del='no'";
		
		req.setAttribute("huodongList", gethuodongList(sql));
		req.getRequestDispatcher("admin/huodong/huodongList.jsp").forward(req, res);
	}
	
	private List gethuodongList(String sql)
	{
		List huodongList=new ArrayList();
		
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				THuodong huodong=new THuodong();
				
				huodong.setId(rs.getString("id"));
				huodong.setMingcheng(rs.getString("mingcheng"));
				huodong.setShijian(rs.getString("shijian"));
				huodong.setDidian(rs.getString("didian"));
				huodong.setNeirong(rs.getString("neirong"));
				
				huodongList.add(huodong);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();		
		
		return huodongList;
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
