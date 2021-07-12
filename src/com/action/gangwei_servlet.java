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
import com.orm.TGangwei;

public class gangwei_servlet extends HttpServlet
{
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	{
        String type=req.getParameter("type");
		
		if(type.endsWith("gangweiAdd"))
		{
			gangweiAdd(req, res);
		}
		if(type.endsWith("gangweiMana"))
		{
			gangweiMana(req, res);
		}
		if(type.endsWith("gangweiList"))
		{
			gangweiList(req, res);
		}
		if(type.endsWith("gangweiDel"))
		{
			gangweiDel(req, res);
		}
	}
	
	public void gangweiAdd(HttpServletRequest req,HttpServletResponse res)
	{
		String mingcheng=req.getParameter("mingcheng");
		String qishi=req.getParameter("qishi");
		String jiezhi=req.getParameter("jiezhi");
		String neirong=req.getParameter("neirong");
		String baochou=req.getParameter("baochou");
		String del="no";
		
		String sql="insert into t_gangwei (mingcheng,qishi,jiezhi,neirong,baochou,del)" +
				   "values(?,?,?,?,?,?)";
		Object[] params={mingcheng,qishi,jiezhi,neirong,baochou,del};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "gangwei?type=gangweiMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	
	
	public void gangweiDel(HttpServletRequest req,HttpServletResponse res)
	{
		String id=req.getParameter("id");
		
		String sql="update t_gangwei set del='yes' where id=?";
		Object[] params={id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "gangwei?type=gangweiMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	
	public void gangweiMana(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String sql="select * from t_gangwei where del='no'";
		
		req.setAttribute("gangweiList", getgangweiList(sql));
		req.getRequestDispatcher("admin/gangwei/gangweiMana.jsp").forward(req, res);
	}
	
	public void gangweiList(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String sql="select * from t_gangwei where del='no'";
		
		req.setAttribute("gangweiList", getgangweiList(sql));
		req.getRequestDispatcher("admin/gangwei/gangweiList.jsp").forward(req, res);
	}
	
	private List getgangweiList(String sql)
	{
		List gangweiList=new ArrayList();
		
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				TGangwei gangwei=new TGangwei();
				
				gangwei.setId(rs.getString("id"));
				gangwei.setMingcheng(rs.getString("mingcheng"));
				gangwei.setQishi(rs.getString("qishi"));
				gangwei.setJiezhi(rs.getString("jiezhi"));
				gangwei.setNeirong(rs.getString("neirong"));
				gangwei.setBaochou(rs.getString("baochou"));
				
				gangweiList.add(gangwei);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();		
		
		return gangweiList;
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
