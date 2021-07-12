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

public class bumen_servlet extends HttpServlet
{
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	{
        String type=req.getParameter("type");
		
		if(type.endsWith("bumenMana"))
		{
			bumenMana(req, res);
		}
		if(type.endsWith("bumenAdd"))
		{
			bumenAdd(req, res);
		}
		if(type.endsWith("bumenDel"))
		{
			bumenDel(req, res);
		}
	}
	
	
	public void bumenAdd(HttpServletRequest req,HttpServletResponse res)
	{
		String mingcheng=req.getParameter("mingcheng");
		String del="no";
		String sql="insert into t_bumen (mingcheng,del) values(?,?)";
		Object[] params={mingcheng,del};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "�����ɹ�");
		req.setAttribute("path", "bumen?type=bumenMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	
	public void bumenDel(HttpServletRequest req,HttpServletResponse res)
	{
		String id = req.getParameter("id");
		String sql="update t_bumen set del='yes' where id="+id;
		Object[] params={};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "bumen?type=bumenMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}

	public void bumenMana(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
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
		
		req.setAttribute("bumenList", bumenList);
		req.getRequestDispatcher("admin/bumen/bumenMana.jsp").forward(req, res);
	}
	public void dispatch(String targetURI,HttpServletRequest request,HttpServletResponse response) 
	{
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher(targetURI);
		try 
		{
		    dispatch.forward(request, response);
		    return;
		} 
		catch (Exception e) 
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
