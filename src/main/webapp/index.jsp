<%@page import="org.mongodb.UserDAO"%>
<%@page import="org.mongodb.User"%>
<%@page import="com.mongodb.DBObject"%>
<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="com.mongodb.DB"%>
<%@page import="org.mongodb.ConnectionBase"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TiaCaraks | Log in</title>
          <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
          <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
          <link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css">
          <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
          <link rel="stylesheet" href="plugins/iCheck/square/blue.css">
        <%
            ConnectionBase mon = new ConnectionBase();
            String login = request.getParameter("Login");
            if(login != null) {
                DB db = mon.getConnection();
                DBCollection table = db.getCollection("users");
                
                String uname = request.getParameter("username");
                String pwd = request.getParameter("password");

                BasicDBObject query = new BasicDBObject();
                query.put("pseudo", uname);
                query.put("mdp", pwd);
                BasicDBObject where = new BasicDBObject();
                where.put("$and",query);
                DBObject doc = table.findOne(query);
                if(doc != null) {
                    session.setAttribute("id", request.getParameter("_id"));
                    response.sendRedirect("page_musique.jsp");
                }
                else {
                    out.println("Pas GG!");
                }
            } 
        %>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
    </head>
    <body class="hold-transition login-page">
        <div class="login-box">
         <div class="login-logo">
           <a href="index.jsp"><b>Tia</b>Caraks</a>
         </div>
           <div class="login-box-body">
             <p class="login-box-msg">Sign in to start your session</p>
               <form action="index.jsp" method="post">
                 <div class="form-group has-feedback">
                   <input type="text" class="form-control" placeholder="Pseudo" name="username">
                   <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                 </div>
                 <div class="form-group has-feedback">
                   <input type="password" class="form-control" placeholder="Mot de passe" name="password">
                   <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                 </div>
                 <div class="row">
                   <div class="col-xs-8">
                     
                   </div>
                   <!-- /.col -->
                   <div class="col-xs-4">
                     <button type="submit" class="btn btn-primary btn-block btn-flat" name="Login">Sign In</button>
                   </div>
                   <!-- /.col -->
                 </div>
               </form>

               <a href="#">Forgot my password?</a><br>
               <a href="register.jsp" class="text-center">Register a new membership</a>
           </div>
        </div>
    </body>
</html>
