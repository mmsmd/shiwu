<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />

		<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
		
        <script language="javascript">
           function userDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/user?type=userDel&id="+id;
               }
           }
           function userAdd()
           {
                 var url="<%=path %>/user?type=userToAdd";
				 window.location.href=url;
           }
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/images/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="9" background="<%=path %>/images/tbg.gif">&nbsp;人员管理&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td>登录账号</td>
					<td>真实姓名</td>
					<td>所在部门</td>
					<td>性别</td>
					<td>班级</td>
					<td>联系电话</td>
					<td>qq</td>
					<td>职务</td>
					<td>操作</td>
		        </tr>	
				<c:forEach items="${requestScope.userList}" var="user">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
					    ${user.loginname }
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${user.xingming }
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${user.bmmc }
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${user.xingbie }
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${user.banji }
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${user.lianxi }
					</td>
					<td bgcolor="#FFFFFF" align="center">
					   ${user.qq }
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<c:if test="${user.type==1}">
					   		干部
					   </c:if>
						<c:if test="${user.type==2}">
					   		学生
					   </c:if>
					</td>
					<td  bgcolor="#FFFFFF" align="center">
						<input type="button" value="删除" onclick="userDel(${user.id })"/>
					</td>
				</tr>
				</c:forEach>
			</table>
			<table width='98%'  border='0'style="margin-top:8px;margin-left: 5px;">
			  <tr>
			    <td>
			      <input type="button" value="添加" style="width: 80px;" onclick="userAdd()" />
			    </td>
			  </tr>
		    </table>
	</body>
</html>
