<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录</title>
<link rel="stylesheet" href="css/logincss.css">

<script>
function login(){
    if(form.id.value!="admin"||form.pw.value!="123456"){
        alert("输入有误");
        return false;
    }
    else{
        form.action="index.jsp"
        form.submit();
        return true;
    }
}
</script>
</head>
<body  background="imag/bg.jpeg">

<div class="content">    
     <div class="main">
         <h1>Welcome</h1>
         <form name="form">
             <input type="text" name="id" placeholder="账号"/>
             <input type="password" name="pw" placeholder="密码">
            <button type="button" onClick="login()">登&nbsp;&nbsp;录</button>
         </form>
     </div>
</div>


</body>
</html>