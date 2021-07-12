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
		<script type="text/javascript">
           function huifuAdd(id)
           {
               var strUrl = "<%=path %>/admin/renyuan/huifuAdd.jsp?id="+id;
               var ret = window.showModalDialog(strUrl,"","dialogWidth:600px; dialogHeight:300px; dialogLeft: status:no; directories:yes;scrollbars:yes;Resizable=no;");
               window.location.reload();
           }		
		</script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/img/allbg.gif'>			
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="9" background="<%=path %>/img/tbg.gif">&nbsp;活动职责查看&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td>活动名称</td>
					<td>地点</td>
					<td>时间</td>
					<td>职责</td>
					<td>反馈意见</td>
					<td>反馈时间</td>
					<td>意见反馈</td>
		        </tr>	
				<c:forEach items="${requestScope.hdryList}" var="hdry">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						${hdry.mingcheng}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${hdry.didian}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${hdry.shijian}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${hdry.zhize }
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${hdry.fankui }
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${hdry.fankuishi }
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<c:if test="${empty hdry.fankui}">
							<input type="button" value="意见反馈" onclick="huifuAdd(${hdry.id })">
						</c:if>
					</td>
				</tr>
				</c:forEach>
			</table>
		</div>		    
	</body>
</html>
