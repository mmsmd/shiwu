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
           function checkOrders()
           {
               if(document.formAdd.shouhuoren.value=="")
               { 
                   alert("请输入收货人");
                   return false;
               }
               if(document.formAdd.dizhi.value=="")
               { 
                   alert("请输入收货地址");
                   return false;
               }
               if(document.formAdd.lianxi.value=="")
               { 
                   alert("请输入联系电话");
                   return false;
               }
               
               return true;
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
				    <TD class=Side vAlign=top align=right width="25%">
						<jsp:include flush="true" page="/qiantai/inc/incLeft.jsp"></jsp:include>
					</TD>
					<td width="1">&nbsp;</td>
					<TD class=Side vAlign=top align=right width="75%">
						<TABLE class=dragTable cellSpacing=0 cellPadding=0 width="100%" border=0>
								<TR>
									<TD class=head>
										<SPAN class=TAG>订单添加</SPAN>
									</TD>
								</TR>
								<TR align="left">
									<TD height="5"></TD>
								</TR>
								<TR align="left" height="527">
									<TD align="center">
									    <form action="<%=path %>/orders?type=ordersAdd" name="formAdd" method="post">
			                                  <table width="100%" border="0" cellpadding="9" cellspacing="9">
													<tr >
													    <td width="10%" bgcolor="#FFFFFF" align="right">
													         收货人：
													    </td>
													    <td  bgcolor="#FFFFFF" align="left">
													        <input type="text" name="shouhuoren"/>
													    </td>
													</tr>
													<tr >
													    <td width="10%" bgcolor="#FFFFFF" align="right">
													         收货地址：
													    </td>
													    <td  bgcolor="#FFFFFF" align="left">
													    	<input type="text" name="dizhi"/>
													    </td>
													</tr>
													<tr >
													    <td width="10%" bgcolor="#FFFFFF" align="right">
													         联系电话：
													    </td>
													    <td  bgcolor="#FFFFFF" align="left">
													        <input type="text" name="lianxi"/>
													    </td>
													</tr>
													<tr>
														<td colspan="2" align="left">
															<input type="hidden" name="goods_id" value="${param.id }">
													       <input type="submit" value="提交" onclick="return checkOrders()"/>&nbsp; 
													       <input type="reset" value="重置"/>&nbsp;														
														</td>
													</tr>										    
						                      </table>
			                            </form>
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
