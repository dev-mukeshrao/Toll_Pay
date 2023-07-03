	  <header class="main-header hidden-print"><a class="logo" href="index.jsp">TollPay</a>
        <nav class="navbar navbar-static-top">
          <!-- Sidebar toggle button--><a class="sidebar-toggle" href="#" data-toggle="offcanvas"></a>
          <!-- Navbar Right Menu-->
          <div class="navbar-custom-menu">
            <ul class="top-nav">
              <!--Notification Menu
              <li class="dropdown notification-menu"><a class="dropdown-toggle" href="#" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-bell-o fa-lg"></i></a>
                <ul class="dropdown-menu">
                  <li class="not-head">You have 4 new notifications.</li>
                  <li><a class="media" href="javascript:;"><span class="media-left media-icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-primary"></i><i class="fa fa-envelope fa-stack-1x fa-inverse"></i></span></span>
                      <div class="media-body"><span class="block">Lisa sent you a mail</span><span class="text-muted block">2min ago</span></div></a></li>
                  <li><a class="media" href="javascript:;"><span class="media-left media-icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-danger"></i><i class="fa fa-hdd-o fa-stack-1x fa-inverse"></i></span></span>
                      <div class="media-body"><span class="block">Server Not Working</span><span class="text-muted block">2min ago</span></div></a></li>
                  <li><a class="media" href="javascript:;"><span class="media-left media-icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-success"></i><i class="fa fa-money fa-stack-1x fa-inverse"></i></span></span>
                      <div class="media-body"><span class="block">Transaction xyz complete</span><span class="text-muted block">2min ago</span></div></a></li>
                  <li class="not-footer"><a href="#">See all notifications.</a></li>
                </ul>
              </li>-->
              <!-- User Menu-->
              <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-user fa-lg"></i></a>
                <ul class="dropdown-menu settings-menu">
                  <li><a href="adminSetting.jsp"><i class="fa fa-cog fa-lg"></i>Change Password</a></li>
                  <li><a href="adminSetting.jsp"><i class="fa fa-user fa-lg"></i>Change Email</a></li>
                  <li><a href="Logout.jsp"><i class="fa fa-sign-out fa-lg"></i> Logout</a></li>
                </ul>
              </li>
            </ul>
          </div>
        </nav>
      </header>
      <!-- Side-Nav-->
      <aside class="main-sidebar hidden-print">
        <section class="sidebar">
          <div class="user-panel">
            <div class="pull-left image"><img class="img-circle" src="https://s3.amazonaws.com/uifaces/faces/twitter/jsa/48.jpg" alt="User Image"></div>
            <div class="pull-left info">
              <p>Admin</p>
              <p class="designation"></p>
            </div>
          </div>
          <!-- Sidebar Menu-->
          <ul class="sidebar-menu">
            <li class="active"><a href="index.jsp"><i class="fa fa-dashboard"></i><span>Dashboard</span></a></li>
            <li class="treeview"><a href="#"><i class="fa fa-laptop"></i><span>Booth</span><i class="fa fa-angle-right"></i></a>
              <ul class="treeview-menu">
                <li><a href="Addbooth.jsp"><i class="fa fa-circle-o"></i> Add Booth</a></li>
                <li><a href="ViewBooth.jsp"><i class="fa fa-circle-o"></i> View Booth</a></li>
              </ul>
            </li>
           <li class="treeview"><a href="#"><i class="fa fa-edit"></i><span> Booth Operator</span><i class="fa fa-angle-right"></i></a>
			<ul class="treeview-menu">
                <li><a href="Addboothop.jsp"><i class="fa fa-circle-o"></i> Add Booth operator</a></li>
                <li><a href="ViewBthOp.jsp"><i class="fa fa-circle-o"></i> View Booth operator</a></li>
              
              </ul>
			</li>
            <li class="treeview"><a href="#"><i class="fa fa-edit"></i><span> Rate</span><i class="fa fa-angle-right"></i></a>
              <ul class="treeview-menu">
                <li><a href="Addrate.jsp"><i class="fa fa-circle-o"></i> Add Rate</a></li>
                <li><a href="ViewRate.jsp"><i class="fa fa-circle-o"></i> View Rate</a></li>
              
              </ul>
            </li>
           
            <li class="treeview"><a href="#"><i class="fa fa-th-list"></i><span> Vehicle</span><i class="fa fa-angle-right"></i></a>
              <ul class="treeview-menu">
                <li><a href="Addveh.jsp"><i class="fa fa-circle-o"></i> Add Vehicle</a></li>
                <li><a href="ViewVehicle.jsp"><i class="fa fa-circle-o"></i> View Vehicle</a></li>
              </ul>
            </li>
            
             <li class="treeview"><a href="#"><i class="fa fa-th-list"></i><span> Journey</span><i class="fa fa-angle-right"></i></a>
              <ul class="treeview-menu">
                <li><a href="Journey.jsp"><i class="fa fa-circle-o"></i> Add Vehicle</a></li>
                <li><a href="Journey.jsp"><i class="fa fa-circle-o"></i> View Vehicle</a></li>
              </ul>
            </li>
            <li class="treeview"><a href="Transaction.jsp"><i class="fa fa-file-text"></i><span>All Transaction</span></a>
            </li>
             <li class="treeview"><a href="contact.jsp"><i class="fa fa-edit"></i><span>Contact</span></a>
            </li>
            <li class="treeview"><a href="#"><i class="fa fa-share"></i><span>Report</span><i class="fa fa-angle-right"></i></a>
              <ul class="treeview-menu">
                <li><a href="Report_bthwise.jsp"><i class="fa fa-circle-o"></i>Booth Wise Report</a></li>
                <li><a href="Report_VhWise.jsp"><i class="fa fa-circle-o"></i><span>Vehicle Wise Report</span></a>
                <li><a href="Report_DateWise.jsp"><i class="fa fa-circle-o"></i><span>Date Wise Report</span></a>
                </li>
              </ul>
            </li>
          </ul>
        </section>
      </aside>
      