<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="util.Util" import="java.sql.*"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>STD时尚会所</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">
  <link href="assets/css/vl.css" rel="stylesheet">

<script>

function del(){
    var r = confirm("确定要删除吗？")
    if (r == true) {
    	changeform.submit();
        return true; 
    } else {
        return false;
    }
} 

</script>


</head>

<body>

  <!-- ======= Header ======= -->
  <header id="header">
    <div class="container">

      <h1><a href="index.jsp">STD时尚会所</a></h1>
      
      <h2> 时尚生活,<span>从头做起</span> &nbsp;&nbsp;Fashion</h2>

      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link active" href="#header">首页</a></li>
          <li><a class="nav-link" href="#VIPs">会员</a></li>
          <li><a class="nav-link" href="#AddVIP">会员登记</a></li>
          <li><a class="nav-link" href="#Logs">会员消费记录</a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

      <div class="social-links">
        <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
        <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
        <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
        <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
      </div>

    </div>
  </header><!-- End Header -->


<section id="VIPs" class="vltop">
会员名单
<table>
    <tr><td><form action="index.jsp#Searchvip" method="post">
        <input type="text" placeholder="搜索有关信息" name="kw" />
        <input type="submit" value="查询">
    </form></td>
    <td>&nbsp;&nbsp;&nbsp;<button onclick="location.href='index.jsp#AddVIP';location.reload();">会员登记</button></td></tr>
</table>
    <p>
    <table class="show">
        <tr>
            <th>姓名</th>
            <th>性别</th>
            <th>手机号</th>
            <th>余额</th>
            <th>注册日期</th>
            <th colspan="3">操作</th>
        </tr>
<%
Connection connection = Util.getConnection();
PreparedStatement preparedStatement=null; 
ResultSet rs=null;
try {
    String sql = "select * from vips order by regdate desc";
    preparedStatement=connection.prepareStatement(sql);
    rs=preparedStatement.executeQuery();
    while(rs.next()){
        out.print( "<tr><td>"+rs.getObject(1)+"</td>"   
                  +"<td>"+rs.getObject(2)+"</td>"   
                  +"<td>"+rs.getObject(3)+"</td>"
                  +"<td>"+rs.getObject(4)+"</td>"
                  +"<td>"+rs.getObject(5)+"</td>"
                  +"<td><a href=Deleteservlet?phone="+rs.getObject(3)+" onclick='javascript:return del()'>删除</a></td>"
                  +"<td><a href=index.jsp?cphone="+rs.getObject(3)+"#Change>修改</a> </td>"
                  +"<td><a href=index.jsp?pphone="+rs.getObject(3)+"&pname="+rs.getObject(1)+"#Pay>消费一笔</a></td><tr>"
                );
    }
    }catch (SQLException  e) {
        e.printStackTrace();
    }finally{
        Util.close(rs);
        Util.close(preparedStatement);
        Util.close(connection);
    }
%>
    </table>

</section>

<section id="AddVIP" class="vltop">
会员登记
<form name="addvipform" method="post" action="Addvipservlet"><p>
    姓名<input type="text" name="addname" required /><p><p>
    性别<input type="text" name="addsex" /><p><p>
    手机号<input type="text" name="addphone" required /><p><p>
    充值金额<input type="number" name="addbalance" required /><p><p>
    <input type="submit" value="确定" />
</form>

 
</section>

<section id="Logs" class="vltop">
会员消费记录
<form action="index.jsp#Searchlog" method="post">
    <input type="text" placeholder="搜索有关信息" name="kw2" />
    <input type="submit" value="查询">
</form>
    
<p>
<table class="show">
        <tr>
            <th>时间</th>
            <th>姓名</th>
            <th>事项</th>
            <th>金额</th>
            <th>手机号</th>
        </tr>
<%
Connection connection2 = Util.getConnection();
PreparedStatement preparedStatement2=null; 
ResultSet rs2=null;
try {
    String sql2 = "select * from logs order by time desc";
    preparedStatement2=connection2.prepareStatement(sql2);
    rs2=preparedStatement2.executeQuery();
    while(rs2.next()){
        out.print( "<tr><td>"+rs2.getObject(1)+"</td>"   
                  +"<td>"+rs2.getObject(2)+"</td>"   
                  +"<td>"+rs2.getObject(3)+"</td>"
                  +"<td>"+rs2.getObject(4)+"</td>"
                  +"<td>"+rs2.getObject(5)+"</td>"
                );
    }
    }catch (SQLException  e) {
        e.printStackTrace();
    }finally{
        Util.close(rs2);
        Util.close(preparedStatement2);
        Util.close(connection2);
    }
%>
    </table>

</section>
 

<!-- 隐藏页面 -->
<section id="Change" class="vltop">
修改会员信息
<p>
<%
String cphone=(String)request.getParameter("cphone");
out.print("正在修改账号（手机号）为"+cphone+"的会员信息");
%>
<p>
<form name="changeform" action="ChangeServlet">
    姓名<input type="text" name="name" required /><p><p>
    性别<input type="text" name="sex" /><p><p>
    <input type="hidden" value="<%=cphone %>" name="phone">
    <input type="submit" value="确定" />
</form>
</section>


<section id="Searchvip" class="vltop">
查询会员信息
    <p>
    <table class="show">
        <tr>
            <th>姓名</th>
            <th>性别</th>
            <th>手机号</th>
            <th>余额</th>
            <th>注册日期</th>
            <th colspan="3">操作</th>
        </tr>
<%
request.setCharacterEncoding("UTF-8");
String kw=(String)request.getParameter("kw");
Connection connection3 = Util.getConnection();
PreparedStatement preparedStatement3=null; 
ResultSet rs3=null;
try {
    String sql3 = "select * from vips where phone like ? or name like ?";
    preparedStatement3=connection3.prepareStatement(sql3);
    preparedStatement3.setString(1,'%'+kw+'%');
    preparedStatement3.setString(2,'%'+kw+'%');
    rs3=preparedStatement3.executeQuery();
    while(rs3.next()){
        out.print( "<tr><td>"+rs3.getObject(1)+"</td>"   
                  +"<td>"+rs3.getObject(2)+"</td>"   
                  +"<td>"+rs3.getObject(3)+"</td>"
                  +"<td>"+rs3.getObject(4)+"</td>"
                  +"<td>"+rs3.getObject(5)+"</td>"
                  +"<td><a href=Deleteservlet?phone="+rs3.getObject(3)+" onclick='javascript:return del()'>删除</a></td>"
                  +"<td><a href=index.jsp?cphone="+rs3.getObject(3)+"#Change>修改</a> </td>"
                  +"<td><a href=index.jsp?pphone="+rs3.getObject(3)+"&pname="+rs3.getObject(1)+"#Pay>消费一笔</a></td><tr>"
                );
    }
    }catch (SQLException  e) {
        e.printStackTrace();
    }finally{
        Util.close(rs3);
        Util.close(preparedStatement3);
        Util.close(connection3);
    }
%>
    </table>
<button onclick="location.href='index.jsp#VIPs';location.reload();">返回</button>
</section>

<section id="Searchlog" class="vltop">
查询消费记录
    <p>
    <table class="show">
        <tr>
            <th>时间</th>
            <th>姓名</th>
            <th>事项</th>
            <th>金额</th>
            <th>手机号</th>
        </tr>
<%
String kw2=(String)request.getParameter("kw2");
Connection connection4 = Util.getConnection();
PreparedStatement preparedStatement4=null; 
ResultSet rs4=null;
try {
    String sql4 = "select * from logs where phone like ? or name like ? or event like ? order by time desc";
    preparedStatement4=connection4.prepareStatement(sql4);
    preparedStatement4.setString(1,'%'+kw2+'%');
    preparedStatement4.setString(2,'%'+kw2+'%');
    preparedStatement4.setString(3,'%'+kw2+'%');
    rs4=preparedStatement4.executeQuery();
    while(rs4.next()){
        out.print( "<tr><td>"+rs4.getObject(1)+"</td>"   
                  +"<td>"+rs4.getObject(2)+"</td>"   
                  +"<td>"+rs4.getObject(3)+"</td>"
                  +"<td>"+rs4.getObject(4)+"</td>"
                  +"<td>"+rs4.getObject(5)+"</td>"
                );
    }
    }catch (SQLException  e) {
        e.printStackTrace();
    }finally{
        Util.close(rs4);
        Util.close(preparedStatement4);
        Util.close(connection4);
    }
%>
    </table>
<button onclick="location.href='index.jsp#Logs';location.reload();">返回</button>
</section>

<section id="Pay" class="vltop">
消费一笔
<p>
<%
String pname=(String)request.getParameter("pname");
String pphone=(String)request.getParameter("pphone");
out.print(pname+"  "+pphone);
%>
<p>
<form action="Addlogservlet">
    <input type="hidden" value="<%=pname %>" name="name">
    <input type="hidden" value="<%=pphone %>" name="phone">
    事项<input type="text" name="event" required>
    金额<input type="number" name="amount" required>
    <button onclick="judge()">确定</button>
</form>
</section>



  <!-- Vendor JS Files -->
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>
  <script src="assets/vendor/purecounter/purecounter.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/waypoints/noframework.waypoints.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>

</body>

</html>