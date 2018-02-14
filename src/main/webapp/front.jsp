<%@page import="org.mongodb.Musique"%>
<%@page import="org.mongodb.MusiqueDAO"%>
<%@page import="org.mongodb.UserDAO"%>
<!DOCTYPE html>
<html >
<head>
  <!-- Site made with Mobirise Website Builder v4.6.1, https://mobirise.com -->
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="generator" content="Mobirise v4.6.1, mobirise.com">
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
  <link rel="shortcut icon" href="assets/images/logomini-1-80x80.png" type="image/x-icon">
  <meta name="description" content="">
  <title>TiaCaraks</title>
  <link rel="stylesheet" href="assets/web/assets/mobirise-icons/mobirise-icons.css">
  <link rel="stylesheet" href="assets/tether/tether.min.css">
  <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/bootstrap/css/bootstrap-grid.min.css">
  <link rel="stylesheet" href="assets/bootstrap/css/bootstrap-reboot.min.css">
  <link rel="stylesheet" href="assets/dropdown/css/style.css">
  <link rel="stylesheet" href="assets/socicon/css/styles.css">
  <link rel="stylesheet" href="assets/theme/css/style.css">
  <link rel="stylesheet" href="assets/mobirise/css/mbr-additional.css" type="text/css">
</head>
        <%
            MusiqueDAO mus = new MusiqueDAO();
            Musique[] musique = mus.listMusique();
            UserDAO user = new UserDAO();
            if(request.getParameter("email") != null && request.getParameter("pseudo") != null && request.getParameter("mdp") != null && request.getParameter("sexe") != null && request.getParameter("nationalite") != null) {
                String email = request.getParameter("email");
                String pseudo = request.getParameter("pseudo");
                String mdp = request.getParameter("mdp");
                String sexe = request.getParameter("sexe");
                String nationalite = request.getParameter("nationalite");
                
                user.insertUsers(email, pseudo, mdp, sexe, nationalite, "0");
        %>    
        <script>
            alert("Inscription reussite!")
        </script>
        <% } %>
        
<body>
  <section class="menu cid-qJ9Wz9txd7" once="menu" id="menu1-e">

    
    <nav class="navbar navbar-expand beta-menu navbar-dropdown align-items-center navbar-fixed-top navbar-toggleable-sm">
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <div class="hamburger">
                <span></span>
                <span></span>
                <span></span>
                <span></span>
            </div>
        </button>
        <div class="menu-logo">
            <div class="navbar-brand">
                <span class="navbar-logo">
                    <a href="front.jsp">
                         <img src="assets/images/logomini-1-80x80.png" alt="Mobirise" title="" style="height: 3.8rem;">
                    </a>
                </span>
            </div>
        </div>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav nav-dropdown" data-app-modern-menu="true">
                <li class="nav-item">
                    <a class="nav-link link text-white display-4" href="#apercu">
                        <span class="mbri-home mbr-iconfont mbr-iconfont-btn"></span>
                        Apercu
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link link text-white display-4" href="#header2-h">
                        <span class="mbri-search mbr-iconfont mbr-iconfont-btn"></span>A propos &nbsp;
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link link text-white display-4" href="#header2-f">
                        <span class="mbri-edit mbr-iconfont mbr-iconfont-btn"></span>
                        Inscription
                    </a>
                </li>
            </ul>
            <div class="navbar-buttons mbr-section-btn"><a class="btn btn-sm btn-primary display-4" id="downloadButton">
                    <span class="mbri-save mbr-iconfont mbr-iconfont-btn "></span>
                    Telecharger</a></div>
<script src="https://www.gstatic.com/firebasejs/4.9.1/firebase.js"></script>
<script>
  // Initialize Firebase
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
  var button = document.getElementById('uploadButton')
  var downloadButton = document.getElementById('downloadButton')
  
  var refDown = storage.ref('tiaCaraks.apk')
  
  downloadButton.addEventListener('click',function(){
	refDown.getDownloadURL().then(function(url){
            console.log("APK download")
            document.location.href=url
            console.log(url)
	})
  })
</script>
        </div>
    </nav>
</section>
<div class="cid-qJ9WzbJoW mbr-fullscreen" id="apercu">
    <div class="container align-center">
        <div class="row justify-content-md-center">
            <div class="col-6">
                </br></br></br>
                <img src="assets/images/Screenshot.png" style="width:300px" align="left">
            </div>
            <div class="mbr-whites col-md-6" >
                </br></br></br></br></br></br></br>
                <h1 class="mbr-section-title mbr-bold pb-3 mbr-fonts-style display-1">TiaCaraks</h1>
                <h3 class="mbr-section-subtitle align-center mbr-light pb-3 mbr-fonts-style display-5">
                    Un jeu fun, <br>fait pour tout le monde !</h3>
            </div>
        </div>
    </div>
    <div class="mbr-arrow hidden-sm-down" aria-hidden="true">
        <a href="#next">
            <i class="mbri-down mbr-iconfont"></i>
        </a>
    </div>
</div>

<section class="cid-qJ9WzbJoWs mbr-fullscreen" id="header2-p">
    <div class="container align-center">
        <h2>APERCU DE LA PLAYLIST</h2>
        <div class="row justify-content-md-center">
            <div class="col-md-6">
                <table class="table table-sm table-dark">
                <% for(int i = 0; i < 5; i++) { %>                        
                <tbody>
                    <tr class="table-primary">
                        <td class="table-info"><img src='assets/images/<% out.print(musique[i].getArtiste()); %>.jpg' width="80px"></br>
                        </td>
                        <td><% out.print(musique[i].getArtiste()); %> - 
                        <% out.print(musique[i].getTitre()); %></br><audio src="music/<% out.print(musique[i].getTitre()); %>.mp3" controls></audio></td>
                    </tr>
                </tbody>
                <% } %>
                </table>
            </div>
            <div class="mbr-whites col-md-6">
                <table class="table table-sm table-dark">
                <% for(int i = 5; i < musique.length; i++) { %>                        
                <tbody>
                    <tr class="table-dark">
                        <td class="table-danger"><img src='assets/images/<% out.print(musique[i].getArtiste()); %>.jpg' width="80px"></br>
                        </td>
                        <td><% out.print(musique[i].getArtiste()); %> - 
                        <% out.print(musique[i].getTitre()); %></br><audio src="music/<% out.print(musique[i].getTitre()); %>.mp3" controls></audio></td>
                    </tr>
                </tbody>
                <% } %>
                </table>
            </div>
        </div>
    </div>
    <div class="mbr-arrow hidden-sm-down" aria-hidden="true">
        <a href="#next">
            <i class="mbri-down mbr-iconfont"></i>
        </a>
    </div>
</section>

<section class="cid-qJa6MtuOkp mbr-fullscreen" id="header2-h">
    <div class="container align-left" id="regle">
	</br></br></br>
        <div class="row justify-content-md-left">
            <div class="mbr-white col-md-7">
                <h1 class="mbr-section-title mbr-bold pb-3 mbr-fonts-style display-1">Regle du jeu</h1>
                
                <p class="mbr-text pb-3 mbr-fonts-style display-5">Deviner le mot manquant de la chanson qui marche&nbsp;<br>afin de completer les paroles et de gagner des points.<br>Rien de plus facile ;-) Amusez-vous!</p>
                <div class="mbr-section-btn"><a class="btn btn-md btn-secondary display-4" href=""><span class="mbri-play mbr-iconfont mbr-iconfont-btn"></span>VIDEO DEMO</a></div>
            </div>
        </div>
    </div>
    <div class="mbr-arrow hidden-sm-down" aria-hidden="true">
        <a href="#next">
            <i class="mbri-down mbr-iconfont"></i>
        </a>
    </div>
</section>

<section class="cid-qJ9WzbJoWL mbr-fullscreen" id="header2-f">
    <div class="container align-center">
        <div class="row justify-content-md-center">
            <div class="col-md-6"></div>
            <div class="mbr-whites col-md-6" style="background: rgba(0,0,0,0.2)">
                <h1 class="mbr-section-title mbr-bold pb-3 mbr-fonts-style display-1" style="text-align: center">INSCRIPTION</h1>
                <form action="front.jsp" method="post">
                    <div class="input-group">
                        <span class="input-group-addon" id="basic-addon1">Email</span>
                        <input type="mail" name="email" class="form-control" placeholder="" >
                    </div><br>
                    <div class="input-group">
                        <span class="input-group-addon" id="sizing-addon-2">Pseudo</span>
                        <input type="text" name="pseudo" class="form-control" placeholder="" >
                    </div><br>
                    <div class="input-group">
                        <span class="input-group-addon" id="sizing-addon-2">Mot de passe</span>
                        <input type="password" name="mdp" class="form-control" placeholder="" >
                    </div><br>
                    <div class="input-group">
                        <span class="input-group-addon" id="sizing-addon-2">Sexe</span>
                        <select class="form-control" name="sexe" aria-describedby="sizing-addon-2">
                            <option value="Homme">Homme</option>
                            <option value="Femme">Femme</option>
                        </select>
                    </div><br>
                    <div class="input-group">
                        <span class="input-group-addon" id="sizing-addon-2">Nationalite</span>
                            <select class="form-control" name="nationalite" aria-describedby="sizing-addon-2">
                                <option value="Malagasy">Malagasy</option>
                                <option value="Francais">Francais</option>
                                <option value="Autre">Autre</option>
                            </select>		
                    </div><br>
                    <button type="submit" class="btn btn-block btn-info" style="background: #c11"> S'inscrire </button>
                </form>
            </div>
        </div>
    </div>
    <div class="mbr-arrow hidden-sm-down" aria-hidden="true">
        <a href="#next">
            <i class="mbri-down mbr-iconfont"></i>
        </a>
    </div>
</section>
    
<section class="cid-qJ9WzeYpDo mbr-reveal" id="footer1-g">

    <div class="container">
        <div class="media-container-row content text-white">
            <div class="col-12 col-md-3">
                <div class="media-wrap">
                    <a href="https://mobirise.com/">
                        <img src="assets/images/shure-3300x3000.png" alt="Mobirise" title="">
                    </a>
                </div>
            </div>
            <div class="col-12 col-md-3 mbr-fonts-style display-7">
                <h5 class="pb-3"></h5>
                <p class="mbr-text"></p>
            </div>
            <div class="col-12 col-md-3 mbr-fonts-style display-7">
                <h5 class="pb-3">
                    Adresse</h5>
                <p class="mbr-text">IT-University Andoharanofotsy<br></p>
            </div>
            <div class="col-12 col-md-3 mbr-fonts-style display-7">
                <h5 class="pb-3">Contacts</h5>
                <p class="mbr-text">Phone: +261 34 91 251 70<br>Email: bentsiory@gmail.com 
				<br>et cedrickrandria@gmail.com
				<br></p>
            </div>
        </div>
        <div class="footer-lower">
            <div class="media-container-row">
                <div class="col-sm-12">
                    <hr>
                </div>
            </div>
            <div class="media-container-row mbr-white">
                <div class="col-sm-6 copyright">
                    <p class="mbr-text mbr-fonts-style display-7">
                        © Copyright 2018 - Tsiory &amp; Cedrick</p>
                </div>
                <div class="col-md-6">
                    
                </div>
            </div>
        </div>
    </div>
</section>


  <script src="assets/web/assets/jquery/jquery.min.js"></script>
  <script src="assets/popper/popper.min.js"></script>
  <script src="assets/tether/tether.min.js"></script>
  <script src="assets/bootstrap/js/bootstrap.min.js"></script>
  <script src="assets/smoothscroll/smooth-scroll.js"></script>
  <script src="assets/dropdown/js/script.min.js"></script>
  <script src="assets/touchswipe/jquery.touch-swipe.min.js"></script>
  <script src="assets/theme/js/script.js"></script>
  
  
</body>
</html>