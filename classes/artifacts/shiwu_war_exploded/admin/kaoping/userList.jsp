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
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/images/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="8" background="<%=path %>/images/tbg.gif">&nbsp;人员考评添加&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td>姓名</td>
					<td>性别</td>
					<td>班级</td>
					<td>联系电话</td>
					<td>qq</td>
					<td>操作</td>
		        </tr>	
				<c:forEach items="${requestScope.userList}" var="user">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						${user.xingming }
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
					<td  bgcolor="#FFFFFF" align="center">
						<form action="<%=path %>/admin/kaoping/kaopingAdd.jsp" method="post">
							<input type="hidden" name="id" value="${user.id }"/>
							<input type="hidden" name="xingming" value="${user.xingming }"/>
							<input type="hidden" name="xingbie" value="${user.xingbie }"/>
							<input type="hidden" name="banji" value="${user.banji }"/>
							<input type="hidden" name="lianxi" value="${user.lianxi }"/>
							<input type="hidden" name="qq" value="${user.qq }"/>
							<input type="submit" value="考评添加"/>
						</form>
					</td>
				</tr>
				</c:forEach>
			</table>
	</body>
</html>
