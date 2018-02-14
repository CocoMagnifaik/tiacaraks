<%@page import="org.mongodb.User"%>
<%@page import="org.mongodb.UserDAO"%>
<%
    UserDAO users = new UserDAO();
    User[] us1s = users.findUserById((String)session.getAttribute("id"));
%>
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="images/<% out.print(us1s[0].getPseudo());%>.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p><% out.println(us1s[0].getPseudo());%></p>
          <i class="fa fa-circle text-success"></i> Online
        </div>
      </div>
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">MAIN NAVIGATION</li>
        <li class="active treeview">
          <a href="#">
            <i class="fa fa-dashboard"></i> <span>Chanson</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li class="active"><a href="page_musique.jsp"><i class="fa fa-circle-o"></i> Insertion</a></li>
            <li><a href="page_musique_modifier.jsp"><i class="fa fa-circle-o"></i> Modification</a></li>
          </ul>
        </li>
        <li>
          <a href="page_statistique.jsp">
            <i class="fa fa-files-o"></i>
            <span>Statistiques</span>
          </a>
        </li>
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>