<%@page import="org.mongodb.User"%>
<%@page import="org.bson.types.ObjectId"%>
<%@page import="org.mongodb.Musique"%>
<%@page import="org.mongodb.MusiqueDAO"%>
<%@page import="org.mongodb.UserDAO"%>
<!DOCTYPE html>
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TiaCaraks | Modification</title>
          <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
          <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
          <link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css">
          <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
          <link rel="stylesheet" href="plugins/iCheck/square/blue.css">
  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
  <!-- Morris chart -->
  <link rel="stylesheet" href="bower_components/morris.js/morris.css">
  <!-- jvectormap -->
  <link rel="stylesheet" href="bower_components/jvectormap/jquery-jvectormap.css">
  <!-- Date Picker -->
  <link rel="stylesheet" href="bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="bower_components/bootstrap-daterangepicker/daterangepicker.css">
  <!-- bootstrap wysihtml5 - text editor -->
  <link rel="stylesheet" href="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">

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
            MusiqueDAO musique = new MusiqueDAO();
            Musique[] musicTable = musique.listMusique();
            if(insert != null) {
                String idChanson = request.getParameter("idChanson");
                String musicById = musique.findTitreMusicById(idChanson);
                String paroles = request.getParameter("paroles");
                musique.updateMusique(musicById, paroles);
            }
        %>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

    <%@ include file="header.jsp" %>

  <!-- Left side column. contains the logo and sidebar -->
      <%@ include file="aside.jsp" %>  


  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Chanson
        <small>Modification</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="page_musique.php"><i class="fa fa-dashboard"></i> Accueil</a></li>
        <li class="active">Chanson</li>
      </ol>
    </section>

    <section class="content">
      <div class="row">
        <div class="col-lg-3 col-xs-6">
          <div class="small-box bg-red">
            <div class="inner">
              <h3><% out.print(listUser.length);%></h3>
              <p>Nombre de joueurs</p>
            </div>
            <div class="icon">
              <i class="ion ion-person-add"></i>
            </div>
            <a href="page_detail.jsp" class="small-box-footer">Pour plus d'info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
       
      </div>

        <div class="row">
        <section class="col-lg-7 connectedSortable">
          <div class="box box-info">
            <div class="box-header">
              <h3 class="box-title">Modifier les paroles</h3>
              <div class="pull-right box-tools">
                <button type="button" class="btn btn-info btn-sm" data-widget="remove" data-toggle="tooltip"
                        title="Remove">
                  <i class="fa fa-times"></i></button>
              </div>
            </div>
            <div class="box-body">
              <form action="page_musique_modifier.jsp" method="post">
                <div class="form-group">
                    <select class="form-control" name="idChanson" id="idChanson" aria-describedby="sizing-addon-2">
                <%  for(int i = 0; i < musicTable.length; i++) { %>                       
                        <option value="<% out.println(musicTable[i].getId());%>"><% out.println(musicTable[i].getArtiste());%> - <% out.println(musicTable[i].getTitre());%></option>
                <%  } %>
                    </select>
                </div>
                <div>
                  <textarea class="textarea" placeholder="Paroles" name="paroles" style="width: 100%; height: 125px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></textarea>
                </div>
                <div class="box-footer clearfix">
                  <button type="submit" class="pull-right btn btn-default" id="insert" name="insert">Modifier<i class="fa fa-arrow-circle-right"></i></button>
                </div>
              </form>
            </div>
          </div>
        </section>
      </div>
    </section>
  </div>
  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Project by</b> Cedrick & Tsiory
    </div>
    <strong>Copyright &copy; 2018.</strong> All rights
    reserved.
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Create the tabs -->
    <h3 align="center"><a href="deconnexion.jsp">Deconnexion</a></h3>
    <!-- Tab panes -->
  </aside>
  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- jQuery 3 -->
<script src="bower_components/jquery/dist/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="bower_components/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button);
</script>
<!-- Bootstrap 3.3.7 -->
<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>
<script src="dist/js/demo.js"></script>
</body>
</html>