<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<html>
  <head>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
    <LINK href="<%=path %>/css/css.css" type=text/css rel=stylesheet>
    
         <script type="text/javascript">
           function ordersDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/orders?type=ordersDel&id="+id;
               }
           }
       </script>
  </head>
  
  <BODY text=#000000  leftMargin=0 topMargin=0>
	<div class="wrap"> 
		<TABLE  cellSpacing=0 cellPadding=0 width="100%" align=center border=0  background="<%=path %>/img/reservation01.jpg">
				<TR height="90">
					<TD align="left">
					    <jsp:include flush="true" page="/qiantai/inc/incTop1.jsp"></jsp:include> 
					</TD>
				</TR>
		</TABLE>
		
		
		<TABLE id=guide cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
				<TR>
					<TD align="left">
						<jsp:include flush="true" page="/qiantai/inc/incTop2.jsp"></jsp:include>
					</TD>
				</TR>
		</TABLE>

        <TABLE class=MainTable style="MARGIN-TOP: 0px" cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
				<TR>
				    <TD class=Side vAlign=top align=right width="22%">
						<jsp:include flush="true" page="/qiantai/inc/incLeft.jsp"></jsp:include>
					</TD>
					<td width="1">&nbsp;</td>
					<TD class=Side vAlign=top align=right width="87%">
						<TABLE class=dragTable cellSpacing=0 cellPadding=0 width="100%" border=0>
								<TR>
									<TD class=head>
										<span style="float:left">订单管理</span>
							            <span style="float:right">&nbsp;&nbsp;&nbsp;&nbsp;</span>
									</TD>
								</TR>
								<TR align="left" height="160">
									<TD>
										<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
											<tr align="center" bgcolor="#FAFAF1" height="22">
												<td>商品编号</td>
												<td>商品名称</td>
												<td>商品价格</td>
												<td>收货人</td>
												<td>收货地址</td>
												<td>联系电话</td>
												<td>当前状态</td>
												<td>操作</td>
									        </tr>	
											<c:forEach items="${requestScope.ordersList}" var="orders" varStatus="sta">
											<tr align='center' bgcolor="#FFFFFF">
												<td bgcolor="#FFFFFF" align="center">${orders.bianhao}</td>
												<td bgcolor="#FFFFFF" align="center">${orders.mingcheng}</td>
												<td bgcolor="#FFFFFF" align="center">${orders.jiage}</td>
												<td bgcolor="#FFFFFF" align="center">${orders.shouhuoren}</td>
												<td bgcolor="#FFFFFF" align="center">${orders.dizhi}</td>
												<td bgcolor="#FFFFFF" align="center">${orders.lianxi}</td>
												<td bgcolor="#FFFFFF" align="center">
													<c:if test="${orders.zt=='0'}">
														等待发货
													</c:if>
													<c:if test="${orders.zt=='1'}">
														已发货
													</c:if>
												</td>
												<td bgcolor="#FFFFFF" align="center">
													<c:if test="${orders.zt=='0'}">
														<input type="button" value="删除" onclick="ordersDel(${orders.id})"/>
													</c:if>												
												</td>
											</tr>
											</c:forEach>
										</table>
									</TD>
								</TR>
								<TR align="left">
									<TD height="5"></TD>
								</TR>
						</TABLE>
					</TD>
				</TR>
		</TABLE>
		<jsp:include flush="true" page="/qiantai/inc/incFoot.jsp"></jsp:include>
    </div>
  </BODY>
</html>
