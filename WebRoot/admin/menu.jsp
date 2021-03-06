<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 

<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'menu.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="<%=path %>/css/base.css" type="text/css" />
	<link rel="stylesheet" href="<%=path %>/css/menu.css" type="text/css" />
	<style type="text/css">
	    div {
			padding:0px;
			margin:0px;
		}
		
		body {
		 scrollbar-base-color:#bae87c;
		 scrollbar-arrow-color:#FFFFFF;
		 scrollbar-shadow-color:#c1ea8b;
		 padding:0px;
		 margin:auto;
		 text-align:center;
		 background-color:#1e90ff;
		}
		
		dl.bitem {
			width:148px;
			margin:0px 0px 5px 4px;
		}
		
		dl.bitem dt {
		  background:url(<%=path %>/img/menubg1.gif);
		  height:26px;
		  line-height:26px;
		  text-align:center;
		  cursor:pointer;
		}
		
		dl.bitem dd {
		  padding:3px 3px 3px 3px;
		  background-color:#fff;
		}
		
		.fllct
		{
			float:left;
			
			width:90px;
		}
		
		.flrct
		{
			padding-top:3px;
			float:left;
		}
		
		div.items
		{
			line-height:22px;
			background:url(<%=path %>/img/arr4.gif) no-repeat 10px 9px;
		}
		
		span.items
		{
			padding:10px 0px 10px 22px;
			background:url(<%=path %>/img/arr4.gif) no-repeat 10px 12px;
		}
		
		ul {
		  padding-top:3px;
		}
		
		li {
		  height:22px;
		}
		
		.sitemu li {
			padding:0px 0px 0px 22px;
			line-height:24px;
			background:url(<%=path %>/img/arr4.gif) no-repeat 10px 9px;
		}
	</style>
	<script language='javascript'>var curopenItem = '1';</script>
	<script language="javascript" type="text/javascript" src="<%=path %>/js/menu.js"></script>
	<base target="main" />
  </head>
  
  <body target="main">
  <c:if test="${sessionScope.userType==0}">
	<table width='99%' height="100%" border='0' cellspacing='0' cellpadding='0'>
	  <tr>
	    <td style='padding-left:3px;padding-top:8px' valign="top">
	      <dl class='bitem'>
	        <dt onClick='showHide("items1_1")'><b>??????????????????</b></dt>
	        <dd style='display:block' class='sitem' id='items1_1'>
	          <ul class='sitemu'>
	              <li><a href='<%=path %>/admin/userinfo/userPw.jsp' target='main'>??????????????????</a> </li>
	          </ul>
	        </dd>
	      </dl>
	      <dl class='bitem'>
	        <dt onClick='showHide("items2_1")'><b>??????????????????</b></dt>
	        <dd style='display:block' class='sitem' id='items2_1'>
	          <ul class='sitemu'>
                 <li><a href='<%=path %>/admin/bumen/bumenAdd.jsp' target='main'>??????????????????</a> </li>
                 <li><a href='<%=path %>/bumen?type=bumenMana' target='main'>??????????????????</a> </li>
	          </ul>
	        </dd>
	      </dl>	
	      <dl class='bitem'>
	        <dt onClick='showHide("items2_1")'><b>??????????????????</b></dt>
	        <dd style='display:block' class='sitem' id='items2_1'>
	          <ul class='sitemu'>
                 <li><a href='<%=path %>/user?type=userToAdd' target='main'>??????????????????</a> </li>
                 <li><a href='<%=path %>/user?type=userMana' target='main'>??????????????????</a> </li>
	          </ul>
	        </dd>
	      </dl>	
	      <dl class='bitem'>
	        <dt onClick='showHide("items2_1")'><b>??????????????????</b></dt>
	        <dd style='display:block' class='sitem' id='items2_1'>
	          <ul class='sitemu'>
                 <li><a href='<%=path %>/admin/news/newsAdd.jsp' target='main'>??????????????????</a> </li>
                 <li><a href='<%=path %>/news?type=newsMana' target='main'>??????????????????</a> </li>
	          </ul>
	        </dd>
	      </dl>	
		  </td>
	  </tr>
	</table>
	</c:if>
	
  <c:if test="${sessionScope.userType==1}">
	<table width='99%' height="100%" border='0' cellspacing='0' cellpadding='0'>
	  <tr>
	    <td style='padding-left:3px;padding-top:8px' valign="top">
	      <dl class='bitem'>
	        <dt onClick='showHide("items1_1")'><b>??????????????????</b></dt>
	        <dd style='display:block' class='sitem' id='items1_1'>
	          <ul class='sitemu'>
	             <li><a href='<%=path %>/user?type=userToUpd' target='main'>??????????????????</a> </li>
	          </ul>
	        </dd>
	      </dl>
	      <dl class='bitem'>
	        <dt onClick='showHide("items2_1")'><b>??????????????????</b></dt>
	        <dd style='display:block' class='sitem' id='items2_1'>
	          <ul class='sitemu'>
                 <li><a href='<%=path %>/user?type=userList' target='main'>??????????????????</a> </li>
                 <li><a href='<%=path %>/kaoping?type=kaopingMana' target='main'>??????????????????</a> </li>
	          </ul>
	        </dd>
	      </dl>	
	      <dl class='bitem'>
	        <dt onClick='showHide("items2_1")'><b>??????????????????</b></dt>
	        <dd style='display:block' class='sitem' id='items2_1'>
	          <ul class='sitemu'>
                 <li><a href='<%=path %>/admin/huodong/huodongAdd.jsp' target='main'>??????????????????</a> </li>
                 <li><a href='<%=path %>/huodong?type=huodongMana' target='main'>??????????????????</a> </li>
	          </ul>
	        </dd>
	      </dl>	
	      <dl class='bitem'>
	        <dt onClick='showHide("items2_1")'><b>??????????????????</b></dt>
	        <dd style='display:block' class='sitem' id='items2_1'>
	          <ul class='sitemu'>
                 <li><a href='<%=path %>/admin/gangwei/gangweiAdd.jsp' target='main'>??????????????????</a> </li>
                 <li><a href='<%=path %>/gangwei?type=gangweiMana' target='main'>??????????????????</a> </li>
	          </ul>
	        </dd>
	      </dl>	
	      <dl class='bitem'>
	        <dt onClick='showHide("items2_1")'><b>??????????????????</b></dt>
	        <dd style='display:block' class='sitem' id='items2_1'>
	          <ul class='sitemu'>
                 <li><a href='<%=path %>/huodong?type=huodongList' target='main'>??????????????????</a> </li>
                 <li><a href='<%=path %>/hdry?type=hdryMana' target='main'>??????????????????</a> </li>
	          </ul>
	        </dd>
	      </dl>	
	      <dl class='bitem'>
	        <dt onClick='showHide("items2_1")'><b>??????????????????</b></dt>
	        <dd style='display:block' class='sitem' id='items2_1'>
	          <ul class='sitemu'>
                 <li><a href='<%=path %>/hdry?type=hdryMe' target='main'>??????????????????</a> </li>
	          </ul>
	        </dd>
	      </dl>	      
	      <dl class='bitem'>
	        <dt onClick='showHide("items2_1")'><b>??????????????????</b></dt>
	        <dd style='display:block' class='sitem' id='items2_1'>
	          <ul class='sitemu'>
                 <li><a href='<%=path %>/news?type=newsAll' target='main'>??????????????????</a> </li>
	          </ul>
	        </dd>
	      </dl>		      
		  </td>
	  </tr>
	</table>
	</c:if>
	
  <c:if test="${sessionScope.userType==2}">
	<table width='99%' height="100%" border='0' cellspacing='0' cellpadding='0'>
	  <tr>
	    <td style='padding-left:3px;padding-top:8px' valign="top">
	      <dl class='bitem'>
	        <dt onClick='showHide("items1_1")'><b>??????????????????</b></dt>
	        <dd style='display:block' class='sitem' id='items1_1'>
	          <ul class='sitemu'>
	              <li><a href='<%=path %>/user?type=userToUpd' target='main'>??????????????????</a> </li>
	          </ul>
	        </dd>
	      </dl>
	      <dl class='bitem'>
	        <dt onClick='showHide("items2_1")'><b>??????????????????</b></dt>
	        <dd style='display:block' class='sitem' id='items2_1'>
	          <ul class='sitemu'>
                 <li><a href='<%=path %>/kaoping?type=kaopingMe' target='main'>??????????????????</a> </li>
	          </ul>
	        </dd>
	      </dl>	
	      <dl class='bitem'>
	        <dt onClick='showHide("items2_1")'><b>??????????????????</b></dt>
	        <dd style='display:block' class='sitem' id='items2_1'>
	          <ul class='sitemu'>
                 <li><a href='<%=path %>/huodong?type=huodongQuery' target='main'>??????????????????</a> </li>
	          </ul>
	        </dd>
	      </dl>	
	      <dl class='bitem'>
	        <dt onClick='showHide("items2_1")'><b>??????????????????</b></dt>
	        <dd style='display:block' class='sitem' id='items2_1'>
	          <ul class='sitemu'>
                 <li><a href='<%=path %>/hdry?type=hdryMe' target='main'>??????????????????</a> </li>
	          </ul>
	        </dd>
	      </dl>	
	      <dl class='bitem'>
	        <dt onClick='showHide("items2_1")'><b>??????????????????</b></dt>
	        <dd style='display:block' class='sitem' id='items2_1'>
	          <ul class='sitemu'>
                 <li><a href='<%=path %>/gangwei?type=gangweiList' target='main'>??????????????????</a> </li>
	          </ul>
	        </dd>
	      </dl>	
	      <dl class='bitem'>
	        <dt onClick='showHide("items2_1")'><b>??????????????????</b></dt>
	        <dd style='display:block' class='sitem' id='items2_1'>
	          <ul class='sitemu'>
                 <li><a href='<%=path %>/news?type=newsAll' target='main'>??????????????????</a> </li>
	          </ul>
	        </dd>
	      </dl>		      
		  </td>
	  </tr>
	</table>
	</c:if>
	
  </body>
</html>
