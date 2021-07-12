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
import com.orm.THdry;
import com.orm.TUser;
import com.util.DateUtils;

public class hdry_servlet extends HttpServlet
{
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	{
        String type=req.getParameter("type");
		
        if(type.endsWith("hdryAdd"))
        {
        	hdryAdd(req, res);
        }
		if(type.endsWith("fankui"))
		{
			fankui(req, res);
		}
		if(type.endsWith("hdryMana"))
		{
			hdryMana(req, res);
		}
		if(type.endsWith("hdryMe"))
		{
			hdryMe(req, res);
		}
		if(type.endsWith("hdryDel"))
		{
			hdryDel(req, res);
		}
	}
	
	public void hdryAdd(HttpServletRequest req,HttpServletResponse res)
	{
		String huodong_id=req.getParameter("id");
		String user_id=req.getParameter("user_id");
		String zhize=req.getParameter("zhize");
		
		String sql="insert into t_hdry (huodong_id,user_id,zhize)" +
		"values(?,?,?)";
		Object[] params={huodong_id,user_id,zhize};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "hdry?type=hdryMana");
		
		String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	public void fankui(HttpServletRequest req,HttpServletResponse res)
	{
		String id=req.getParameter("id");
		String fankui=req.getParameter("fankui");
		String fankuishi=DateUtils.formatDate2Str(new Date(), "yyyy-MM-dd HH:mm:ss");
		
		String sql="update t_hdry set fankui=?,fankuishi=? where id=?";
		Object[] params={fankui,fankuishi,id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("msg", "活动意见反馈完成");
		
        String targetURL = "/common/msg.jsp";
		dispatch(targetURL, req, res);
	}
	
	public void hdryDel(HttpServletRequest req,HttpServletResponse res)
	{
		String id=req.getParameter("id");
		
		String sql="delete from t_hdry where id=?";
		Object[] params={id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "hdry?type=hdryMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	
	public void hdryMana(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String sql="select ta.*,tb.mingcheng,tb.shijian,tb.didian,tc.xingming,tc.banji,tc.lianxi,tc.type " +
		"from t_hdry ta,t_huodong tb,t_user tc where ta.huodong_id=tb.id and ta.user_id=tc.id";
		
		req.setAttribute("hdryList", gethuodongList(sql));
		req.getRequestDispatcher("admin/renyuan/hdryMana.jsp").forward(req, res);
	}
	
	public void hdryMe(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		TUser user = (TUser)req.getSession().getAttribute("user");
		String sql="select ta.*,tb.mingcheng,tb.shijian,tb.didian,tc.xingming,tc.banji,tc.lianxi,tc.type " +
				   "from t_hdry ta,t_huodong tb,t_user tc where ta.huodong_id=tb.id and ta.user_id=tc.id and ta.user_id="+user.getId();
		
		req.setAttribute("hdryList", gethuodongList(sql));
		req.getRequestDispatcher("admin/renyuan/hdryMe.jsp").forward(req, res);
	}
	
	private List gethuodongList(String sql)
	{
		List hdryList=new ArrayList();
		
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				THdry hdry=new THdry();
				
				hdry.setId(rs.getInt("id"));
				hdry.setZhize(rs.getString("zhize"));
				hdry.setFankui(rs.getString("fankui"));
				hdry.setFankuishi(rs.getString("fankuishi"));
				
				hdry.setMingcheng(rs.getString("mingcheng"));
				hdry.setDidian(rs.getString("didian"));
				hdry.setShijian(rs.getString("shijian"));
				
				hdry.setXingming(rs.getString("xingming"));
				hdry.setBanji(rs.getString("banji"));
				hdry.setLianxi(rs.getString("lianxi"));
				hdry.setType(rs.getString("type"));
				hdryList.add(hdry);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();		
		
		return hdryList;
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
