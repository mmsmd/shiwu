<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        <script type="text/javascript" src="<%=path %>/js/popup.js"></script>
        <script type="text/javascript" src="<%=path %>/My97DatePicker/WdatePicker.js"></script>
        <script language="javascript">
			function check(){
				if(document.formAdd.mingcheng.value == "")
				{
					alert("名称不能为空!");
					return false;
				}
				return true;
			}
			
            function openUser(huodong_id)
            {
				var url="<%=path %>/user?type=userSele&id="+huodong_id;
       	   		var ret = window.showModalDialog(url,"学生信息选择","dialogWidth=700px;dialogHeight=300px;status=yes;help=no;scroll=yes");
            	if(ret != null)
            	{
            		document.getElementById("user_id").value = ret[0];
            		document.getElementById("xsxm").value = ret[1];
            	}
            }				
        </script>
	</head>

	<body leftmargin="2" topmargin="9" background='<%=path %>/img/allbg.gif'>
			<form action="<%=path %>/hdry?type=hdryAdd" name="formAdd" method="post">
				     <table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px">
						<tr bgcolor="#EEF4EA">
					        <td colspan="3" background="<%=path %>/img/wbg.gif" class='title'><span>活动人员添加</span></td>
					    </tr>
						<tr align='center' bgcolor="#FFFFFF" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         活动名称：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        ${param.mingcheng }
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         时间：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        ${param.shijian }
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         地点：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
								${param.didian }
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         内容：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        ${param.neirong }
							</td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         学生信息：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
								<input type="text" id="xsxm" readonly="readonly" onclick="openUser(${param.id })"/>点击选择学生
								<input type="hidden" id="user_id" name="user_id"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         职责：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="zhize" size="20"/>
						    </td>
						</tr>												
						<tr align='center' bgcolor="#FFFFFF" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						        &nbsp;
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						    	<input type="hidden" name="id"  value="${param.id }"/>
						       <input type="submit" value="提交" onclick="return check();"/> 
						       <input type="reset" value="返回" onclick="javascript:history.back()"/>&nbsp;
						    </td>
						</tr>
					 </table>
			</form>
   </body>
</html>
