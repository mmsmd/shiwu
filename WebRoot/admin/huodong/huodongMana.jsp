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
        <script language="javascript">
           function huodongDele(id)
           {
               if(confirm('您确定删除吗?'))
               {
                   window.location.href="<%=path %>/huodong?type=huodongDel&id="+id;
               }
           }
           function huodongAdd()
           {
                 var url="<%=path %>/admin/huodong/huodongAdd.jsp";
				 window.location.href=url;
           }
           
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/img/allbg.gif'>			
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="9" background="<%=path %>/img/tbg.gif">&nbsp;活动信息管理&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td>活动名称</td>
					<td>地点</td>
					<td>时间</td>
					<td>内容</td>
					<td>操作</td>
		        </tr>	
				<c:forEach items="${requestScope.huodongList}" var="huodong">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						${huodong.mingcheng}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${huodong.didian}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${huodong.shijian}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${huodong.neirong}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<form action="<%=path %>/admin/huodong/huodongEditPre.jsp" method="post">
							<input type="hidden" name="id" value="${huodong.id }"/>
							<input type="hidden" name="mingcheng" value="${huodong.mingcheng }"/>
							<input type="hidden" name="didian" value="${huodong.didian }"/>
							<input type="hidden" name="shijian" value="${huodong.shijian }"/>
							<input type="hidden" name="neirong" value="${huodong.neirong }"/>					
							<input type="submit" value="修改"/>					
						    <input type="button" onclick="huodongDele(${huodong.id})" value="删除"/>
						</form>
					</td>
				</tr>
				</c:forEach>
			</table>
			
			<table width='98%'  border='0'style="margin-top:8px;margin-left: 5px;">
			  <tr>
			    <td>
			      <input type="button" value="添加" style="width: 80px;" onclick="huodongAdd()" />
			    </td>
			  </tr>
		    </table>
		</div>		    
	</body>
</html>
