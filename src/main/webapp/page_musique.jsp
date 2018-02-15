<%@page import="org.mongodb.User"%>
<%@page import="org.mongodb.MusiqueDAO"%>
<%@page import="org.mongodb.UserDAO"%>
<!DOCTYPE html>
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TiaCaraks | Log in</title>
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
            MusiqueDAO musique = new MusiqueDAO();
                    
            if(request.getParameter("artiste") != null && request.getParameter("titre") != null && request.getParameter("fichier") != null && request.getParameter("image") != null && request.getParameter("paroles") != null) {
                String categorie = request.getParameter("categorie");
                String artiste = request.getParameter("artiste");
                String titre = request.getParameter("titre");
                String fichier = request.getParameter("fichier");
                String image = request.getParameter("image");
                String paroles = request.getParameter("paroles");
                String minutage = request.getParameter("minutage");
                String valiny = request.getParameter("valiny");
                
                musique.insertMusique(categorie, artiste, titre, fichier, image, paroles, minutage, valiny);
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
        <small>Insertion</small>
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
              <h3 class="box-title">Inserer une chanson</h3>
              <div class="pull-right box-tools">
                <button type="button" class="btn btn-info btn-sm" data-widget="remove" data-toggle="tooltip"
                        title="Remove">
                  <i class="fa fa-times"></i></button>
              </div>
            </div>
            <div class="box-body">
              <form action="page_musique.jsp" method="post">
                <div class="input-group form-group">
                   <span class="input-group-addon" id="sizing-addon-2">Categorie</span>
                    <select class="form-control" name="categorie" id="categorie" aria-describedby="sizing-addon-2">
                        <option value="Malagasy">Malagasy</option>
                        <option value="Francais">Francais</option>
                    </select>
                </div>
                <div class="form-group">
                  <input type="text" class="form-control" name="artiste" placeholder="Artiste">
                </div>
                <div class="form-group">
                  <input type="text" class="form-control" name="titre" placeholder="Titre">
                </div>
                <div class="form-group">
                    <progress value="0" max="100" id="uploadProgress">0</progress> Veuillez attendre la fin du telechargement du fichier avant d'appuyer sur "Inserer"!
                  <input type="file" class="form-control" name="fichier" id="fichier" placeholder="Fichier">
                </div>
                <div class="form-group">
                    <progress value="0" max="100" id="uploadProgress">0</progress> Veuillez attendre la fin du telechargement de votre image avant d'appuyer sur "Inserer"!
                  <input type="file" class="form-control" name="image" id="image" placeholder="Image">
                </div>
                <div>
                  <textarea class="textarea" placeholder="Paroles" name="paroles" style="width: 100%; height: 125px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></textarea>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="minutage" placeholder="Minutage s&eacute;par&eacute; par ...">
                </div>
                <div class="form-group">
                  <input type="text" class="form-control" name="valiny" placeholder="Bonne reponse separee par ...">
                </div>
                <div class="box-footer clearfix">
                  <button type="submit" class="pull-right btn btn-success" id="insert" name="insert">Inserer<i class="fa fa-arrow-circle-right"></i></button>
                </div>
<script src="https://www.gstatic.com/firebasejs/4.9.1/firebase.js"></script>
<script>
  var config = {
    apiKey: "AIzaSyAqTFon0izUW-4yOw75BUO_6C40KRZhHjc",
    authDomain: "tiacaracks.firebaseapp.com",
    databaseURL: "https://tiacaracks.firebaseio.com",
    projectId: "tiacaracks",
    storageBucket: "tiacaracks.appspot.com",
    messagingSenderId: "838960149255"
  };
  firebase.initializeApp(config);
  var storage = firebase.storage();
  
  var progress = document.getElementById('uploadProgress')
  var button = document.getElementById('fichier')
    
  button.addEventListener('change',function(e){
	var file = e.target.files[0];
	var storageRef = storage.ref(file.name)
	var uploadTask = storageRef.put(file)
	
	uploadTask.on('state_changed',loadUpload,errUpload,completeUpload)
	
	function loadUpload(data){
		var percent = (data.bytesTransferred/data.totalBytes) * 100
		progress.value = percent
	}
	
	function errUpload(err){
		console.log('error')
		console.log(err)
	}

	function completeUpload(data){
		console.log('success')
		console.log(data)
	}
  })
</script>
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
    <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
      <li><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
      <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
    </ul>
    <!-- Tab panes -->
    <div class="tab-content">
      <!-- Home tab content -->
      <div class="tab-pane" id="control-sidebar-home-tab">
        <h3 class="control-sidebar-heading">Recent Activity</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="javascript:void(0)">
              <i class="menu-icon fa fa-birthday-cake bg-red"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

                <p>Will be 23 on April 24th</p>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <i class="menu-icon fa fa-user bg-yellow"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Frodo Updated His Profile</h4>

                <p>New phone +1(800)555-1234</p>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <i class="menu-icon fa fa-envelope-o bg-light-blue"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Nora Joined Mailing List</h4>

                <p>nora@example.com</p>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <i class="menu-icon fa fa-file-code-o bg-green"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Cron Job 254 Executed</h4>

                <p>Execution time 5 seconds</p>
              </div>
            </a>
          </li>
        </ul>
        <!-- /.control-sidebar-menu -->

        <h3 class="control-sidebar-heading">Tasks Progress</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="javascript:void(0)">
              <h4 class="control-sidebar-subheading">
                Custom Template Design
                <span class="label label-danger pull-right">70%</span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <h4 class="control-sidebar-subheading">
                Update Resume
                <span class="label label-success pull-right">95%</span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-success" style="width: 95%"></div>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <h4 class="control-sidebar-subheading">
                Laravel Integration
                <span class="label label-warning pull-right">50%</span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-warning" style="width: 50%"></div>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <h4 class="control-sidebar-subheading">
                Back End Framework
                <span class="label label-primary pull-right">68%</span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-primary" style="width: 68%"></div>
              </div>
            </a>
          </li>
        </ul>
        <!-- /.control-sidebar-menu -->

      </div>
      <!-- /.tab-pane -->
      <!-- Stats tab content -->
      <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
      <!-- /.tab-pane -->
      <!-- Settings tab content -->
      <div class="tab-pane" id="control-sidebar-settings-tab">
        <form method="post">
          <h3 class="control-sidebar-heading">General Settings</h3>

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Report panel usage
              <input type="checkbox" class="pull-right" checked>
            </label>

            <p>
              Some information about this general settings option
            </p>
          </div>
          <!-- /.form-group -->

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Allow mail redirect
              <input type="checkbox" class="pull-right" checked>
            </label>

            <p>
              Other sets of options are available
            </p>
          </div>
          <!-- /.form-group -->

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Expose author name in posts
              <input type="checkbox" class="pull-right" checked>
            </label>

            <p>
              Allow the user to show his name in blog posts
            </p>
          </div>
          <!-- /.form-group -->

          <h3 class="control-sidebar-heading">Chat Settings</h3>

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Show me as online
              <input type="checkbox" class="pull-right" checked>
            </label>
          </div>
          <!-- /.form-group -->

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Turn off notifications
              <input type="checkbox" class="pull-right">
            </label>
          </div>
          <!-- /.form-group -->

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Delete chat history
              <a href="javascript:void(0)" class="text-red pull-right"><i class="fa fa-trash-o"></i></a>
            </label>
          </div>
          <!-- /.form-group -->
        </form>
      </div>
      <!-- /.tab-pane -->
    </div>
  </aside>
  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- jQuery 3 -->
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
