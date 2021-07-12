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
        <script language="javascript">
           function xsSelected()
           {
                 var xsOpts = document.getElementsByName("xsxx");
                 for(var i=0;i<xsOpts.length;i++)
                 {
                 	if(xsOpts[i].checked)
                 	{
                 		var arrxsxx = xsOpts[i].value.split("_");
                 		window.returnValue = arrxsxx;
                 		window.close();
                 	}
                 }
           }
           
       </script>		
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/img/allbg.gif'>			
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="8" background="<%=path %>/img/tbg.gif">&nbsp;学生选择&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="10%">&nbsp;</td>
					<td>真实姓名</td>
					<td>所在部门</td>
					<td>性别</td>
					<td>班级</td>
					<td>联系电话</td>
					<td>qq</td>
					<td>职务</td>
		        </tr>	
				<c:forEach items="${requestScope.userList}" var="user">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						<input type="radio" name="xsxx" value="${user.id }_${user.xingming}"/>
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
				</tr>
				</c:forEach>
			</table>
			
			<table width='98%'  border='0'style="margin-top:8px;margin-left: 5px;">
			  <tr>
			    <td>
			      <input type="button" value="选择" style="width: 80px;" onclick="xsSelected()" />
			    </td>
			  </tr>
		    </table>			
	</body>
</html>
