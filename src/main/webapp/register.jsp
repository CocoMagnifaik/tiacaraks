<%@page import="org.mongodb.UserDAO"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>TiaCaraks | Login</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
          <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
          <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
          <link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css">
          <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
          <link rel="stylesheet" href="plugins/iCheck/square/blue.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">

        <%
            String insert = request.getParameter("insert");
            UserDAO user = new UserDAO();
            if(insert != null) {
                String email = request.getParameter("email");
                String pseudo = request.getParameter("pseudo");
                String mdp = request.getParameter("mdp");
                String mdp1 = request.getParameter("mdp2");
                String sexe = request.getParameter("sexe");
                String nationalite = request.getParameter("nationalite");
                String statut = "1";
                if(mdp == mdp1){
                    user.insertUsers(email, pseudo, mdp, sexe, nationalite, statut);
                }
                else{
                    out.println("Mot de passe non identiques!");
                }
            }
        %>
</head>
<body class="hold-transition register-page">
<div class="register-box">
  <div class="register-logo">
    <a href="index.index"><b>Tia</b>Caraks</a>
  </div>

  <div class="register-box-body">
    <p class="login-box-msg">Register a new membership</p>

    <form action="register.jsp" method="post">
      <div class="form-group has-feedback">
        <input type="text" class="form-control" placeholder="Pseudo" name="pseudo">
        <span class="glyphicon glyphicon-user form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="email" class="form-control" placeholder="Email" name="email">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" class="form-control" placeholder="Password" name="mdp">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" class="form-control" placeholder="Retype password" name="mdp1">
        <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <select class="form-control" name="sexe" id="sexe" aria-describedby="sizing-addon-2">
            <option value="Homme">Homme</option>
            <option value="Femme">Femme</option>
        </select>
      </div>
      <div class="form-group has-feedback">
        <select class="form-control" name="nationalite" id="nationalite" aria-describedby="sizing-addon-2">
            <option value="Malagasy">Malagasy</option>
            <option value="Francais">Francais</option>
        </select>
      </div>
      <div class="row">
        <div class="col-xs-8">
        </div>
        <!-- /.col -->
        <div class="col-xs-4">
          <button type="submit" class="btn btn-primary btn-block btn-flat">Register</button>
        </div>
        <!-- /.col -->
      </div>
    </form>

    <a href="index.jsp" class="text-center">I already have a membership</a>
  </div>
  <!-- /.form-box -->
</div>
<!-- /.register-box -->

<!-- jQuery 3 -->
<script src="../../bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="../../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="../../plugins/iCheck/icheck.min.js"></script>
<script>
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' // optional
    });
  });
</script>
</body>
</html>
