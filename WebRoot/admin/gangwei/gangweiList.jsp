<%@ page language="java" pageEncoding="UTF-8"%>
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
		<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
		<script type="text/javascript" src="<%=path %>/jsxx/jsxxBus.js"></script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/img/allbg.gif'>			
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="9" background="<%=path %>/img/tbg.gif">&nbsp;岗位信息查询&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td>岗位名称</td>
					<td>起始时间</td>
					<td>截止时间</td>
					<td>内容</td>
					<td>报酬</td>
		        </tr>	
				<c:forEach items="${requestScope.gangweiList}" var="gangwei">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						${gangwei.mingcheng}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${gangwei.qishi}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${gangwei.jiezhi}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${gangwei.neirong}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${gangwei.baochou}
					</td>
				</tr>
				</c:forEach>
			</table>
	</body>
</html>
