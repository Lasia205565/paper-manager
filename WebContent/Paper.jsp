<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script  type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
    <script  type="text/javascript" src="js/ChooseSort.js"></script>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
        <link rel="stylesheet" href="css/operation1.css">
    <title>Paper Manager System</title>  
  </head>
  <body>
  <div class="container">
   <header>
 <a href="index.jsp" id="index">论文管理器</a>
 <a href="<s:url action="Logout" />" id="right">注销</a>
 <a href="<s:url action='addend' />" id="left">用户</a>
 </header>
 <hr>
 <div class="content2">
     <s:form name="form1" action="updatesuccess" method="post" enctype="multipart/form-data">
 	<s:hidden name="paperID"/>
    
    <div id="partb">
      <s:textfield key="paper.author" label="第一作者" />
      <s:textfield key="paper.secondauthor" label="第二作者" />
      <s:textfield key="paper.title" label="论文标题"/>
      <s:textfield key="paper.keyword" label="关键字"/>
      <s:textfield key="paper.publication" label="出版社"/>
    
    </div>
    
     <div id="partc">
     <br>
        <SELECT NAME="first" onChange="getSecond()" class="select">  
         <OPTION value="<s:property  value="firststr"/>"><s:property  value="firststr"/></OPTION> 
           <OPTION VALUE="1">基础学科 </OPTION>  
            <OPTION VALUE="2">工程科技</OPTION>  
            <OPTION VALUE="3">农业科技</OPTION>  
            <OPTION VALUE="4">医学卫生科技</OPTION>  
            <OPTION VALUE="5">哲学与人文科学</OPTION>
 			 <OPTION VALUE="6">社会科学</OPTION>  
            <OPTION VALUE="7">信息科学</OPTION>  
            <OPTION VALUE="8">经济管理科学</OPTION>  
        </SELECT>  
  

        <SELECT NAME="second" onChange="getThird()" class="select">  
            <OPTION value="<s:property  value="secondstr"/>"><s:property  value="secondstr"/></OPTION>  
        </SELECT> 
  
        <select name="third" class="select">
        <option value="<s:property  value="thirdstr"/>"><s:property  value="thirdstr"/></option>
        </select> 
        </div>
        <br>
        <div id="partd">
        <span>请选择发表日期：</span>
        <input name="datetime" value="<s:property  value="dates"/>" style="width: 120px;" onFocus="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd '})" />
        </div>
     
       
        <div id="parte">
      
         <s:submit class="btn btn-default"/>
	    </div>
	
	 
	    </s:form>
	
	</div>
	<footer>
<br>
<span>Created by Group YST</span>
<br/>
<br/>
</footer>
	</div>


  </body>
</html>