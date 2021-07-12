<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
      <script type="text/javascript">
         function admin()
         {
            var url="<%=path %>/login.jsp";
            window.open(url,"_blank");
         } 
         
         function ordersAll()
         {
            <c:if test="${sessionScope.user==null}">
                  alert("请先登录");
            </c:if>
            
            <c:if test="${sessionScope.user!=null}">
                var url="<%=path %>/orders?type=ordersMana";
				window.open(url,"_self");
            </c:if>
         } 
         
         
         function liuyanAll()
         {
            <c:if test="${sessionScope.user==null}">
                  alert("请先登录");
            </c:if>
            
            <c:if test="${sessionScope.user!=null}">
                var url="<%=path %>/liuyan?type=liuyanAll";
				window.open(url,"_blank");
            </c:if>
         } 
         
         function reg()
	        {
	                var url="<%=path %>/qiantai/userinfo/userReg.jsp";
	                var n="";
	                var w="480px";
	                var h="500px";
	                var s="resizable:no;help:no;status:no;scroll:yes";
				    openWin(url,n,w,h,s);
	        }
	        
	     function goodsAll()
         {
            
                var url="<%=path %>/goods?type=goodsAll";
                window.open(url,"_self");
         } 
         
         function xinxiAll(catelog_id)
         {
         	var url="<%=path %>/xinxi?type=xinxiByCatelog&catelog_id="+catelog_id;
         	window.open(url,"_self");
         }
      </script>
  </head>
  
  <body>
       <form action="<%=path %>/goods?type=goods_search" name="f" method="post">
       &nbsp;&nbsp;
       <A href="<%=path %>/qiantai/default.jsp">系统首页</A> &nbsp;&nbsp;
       <A href="#" onclick="reg()">免费注册</A> &nbsp;&nbsp;
       <a href="#" onclick="goodsAll()">商品浏览</A> &nbsp;&nbsp;
       <a href="#" onclick="ordersAll()">订单管理</A> &nbsp;&nbsp;
       <a href="#" onclick="liuyanAll()">在线留言</A> &nbsp;&nbsp;
       <a href="#" onclick="admin()">后台管理</a> &nbsp;&nbsp;
	   </form>
  </body>
</html>
