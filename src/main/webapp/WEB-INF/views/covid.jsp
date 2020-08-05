<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="../assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
  <title>
    Covid 19
  </title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
    name='viewport' />
  <!--     Fonts and icons     -->
  <link rel="stylesheet" type="text/css"
    href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
  <!-- CSS Files -->
  <link href="../assets/css/material-dashboard.css?v=2.1.0" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="../assets/demo/demo.css" rel="stylesheet" />
</head>
<script>
  $(document).ready(function () {
    getLists();
    getHistory();
    md.initDashboardPageCharts();
  });

  function getLists() {
    var url = location.href.split('/')[3];
    var decode = decodeURI(url)
    var id;
    $.ajax({
      type: "GET",
      url: "/names.ajax",
      success: function (result) {
        const obj = JSON.parse(result).names;
        
        $('#liList').empty();
        for (var i = 0; i < obj.length; i++) {
          $('#liList').append(
            '<li id ="'+obj[i].name+'">' +
            '<a class="nav-link" href="../' + obj[i].name + '">' +
            '<i class="material-icons">place</i>' +
            '<p><h4 style="color:#ffffff;">' + obj[i].name + '</h4></p>' +
            '</a>' +
            '</li>')
            if(decode == obj[i].name){
              id = obj[i].name;
            }
        }
        $('#'+id).attr('class','active');
      }
    })
  }
  function refresh(){
    var msg;
        $.ajax({
          type: "GET",
          async: false,
          url: "/refresh.ajax",
          success: function (result) {
           msg = result;
        }
      })
    return msg;
  }

  function getHistory() {
    var param = $('#gubun').val();
    $.ajax({
      type: "GET",
      url: "/history.ajax",
      data: { gubun: param },
      success: function (result) {
        $('#showHistory').empty();
        md.initDashboardPageCharts(result);   
        for (var i = 0; i < result.length; i++) {
          var temp = result[i].stdDay;
          var date = temp.substr(0, temp.length - 3);   
          var num = result[i].incDec - result[i+1].incDec;
          var selector = '#increse'+i;
          $('#showHistory').append(
            '<tr>' +
            '<td><h3 style="color:#ffffff;">' + date + '</h3></td>' +
            '<td><h3 style="color:#ffffff;">' + result[i].incDec + '</h3></td>' +
            '<td><h3 style="color:#ffffff;">' + result[i].defCnt + '</h3></td>' +
            '<td><h3 style="color:#ffffff;">' + result[i].deathCnt + '</h3></td>' +
            '<td><h3 style="color:#ffffff;">' + result[i].isolIngCnt + '</h3></td>' +
            '<td><h3 style="color:#ffffff;">' + result[i].isolClearCnt + '</h3></td>' +
            '<td><h2 id="increse'+i+'">' + num + '</h2></td>' +
            '</tr>'
          )
          if(num > 0){
            $(selector).css('color','#df3030');
          }else{
            $(selector).css('color','#2795c8');
          }
        }
      }
    })
  }

</script>
<input type="hidden" id="gubun" value="${item.gubun}">

<body class="dark-edition">
  <div class="wrapper ">
    <div class="sidebar" data-color="purple" data-background-color="black" data-image="../assets/img/sidebar-2.jpg">
      <div class="logo"><a href="/" class="simple-text logo-normal">
          <h3>코로나 감염현황</h3>
        </a></div>
      <div class="sidebar-wrapper">
        <ul class="nav" id="liList">

        </ul>
      </div>
    </div>

    <div class="main-panel">
      <div class="content">
        <div class="container-fluid">

          <div class="row">
            <div class="col-xl-4 col-lg-12"></div>
            <div class="col-xl-4 col-lg-12">
              <div class="card card-stats">
                <div class="card-header card-header-success card-header-icon">
                  <br>
                  <h2 class="card-title" style="text-align: center; color: #ffffff;">${item.gubun} 현황</h2>
                  <br>
                </div>
              </div>
            </div>
            <div class="col-xl-4 col-lg-12">
              <button onclick="md.showNotification('top','center',refresh())" class="btn btn-primary btn-round">
                <h4>데이터 갱신하기</h4>
              </button>
            </div>
          </div>

          <div class="row">

            <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6">
              <div class="card card-stats">
                <div class="card-header card-header-warning card-header-icon">
                  <div class="card-icon">
                    <i class="material-icons">masks</i>
                  </div>
                  <p class="card-category">
                    <h3 class="card-title" style="text-align: left; color: #ffffff;">신규 확진자
                    </h3><br>
                  </p>
                  <h1 class="card-title" style="text-align: center; color: #ffffff;">${item.incDec}
                    <small>명</small>
                  </h1><br>
                </div>
              </div>
            </div>
            <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6">
              <div class="card card-stats">
                <div class="card-header card-header-warning card-header-icon">
                  <div class="card-icon">
                    <i class="material-icons">masks</i>
                  </div>
                  <p class="card-category">
                    <h3 class="card-title" style="text-align: left; color: #ffffff;">누적 확진자
                    </h3><br>
                  </p>
                  <h1 class="card-title" style="text-align: center; color: #ffffff;">${item.defCnt}
                    <small>명</small>
                  </h1><br>
                </div>
              </div>
            </div>
            <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6">
              <div class="card card-stats">
                <div class="card-header card-header-danger card-header-icon">
                  <div class="card-icon">
                    <i class="material-icons">account_box</i>
                  </div>
                  <p class="card-category">
                    <h3 class="card-title" style="text-align: left; color: #ffffff;">사망자
                    </h3><br>
                  </p>
                  <h1 class="card-title" style="text-align: center; color: #ffffff;">${item.deathCnt}
                    <small>명</small>
                  </h1><br>
                </div>
              </div>
            </div>

            <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6">
              <div class="card card-stats">
                <div class="card-header card-header-info card-header-icon">
                  <div class="card-icon">
                    <i class="material-icons">night_shelter</i>
                  </div>
                  <p class="card-category">
                    <h3 class="card-title" style="text-align: left; color: #ffffff;">격리 중
                    </h3><br>
                  </p>
                  <h1 class="card-title" style="text-align: center; color: #ffffff;">${item.isolIngCnt}
                    <small>명</small>
                  </h1><br>
                </div>
              </div>
            </div>
          </div>

          <div class="row">
            <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6">
              <div class="card card-stats">
                <div class="card-header card-header-success card-header-icon">
                  <div class="card-icon">
                    <i class="material-icons">masks</i>
                  </div>
                  <p class="card-category">
                    <h3 class="card-title" style="text-align: left; color: #ffffff;">국내 발병
                    </h3><br>
                  </p>
                  <h1 class="card-title" style="text-align: center; color: #ffffff;">${item.localOccCnt}
                    <small>명</small>
                  </h1><br>
                </div>
              </div>
            </div>
            <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6">
              <div class="card card-stats">
                <div class="card-header card-header-danger card-header-icon">
                  <div class="card-icon">
                    <i class="material-icons">masks</i>
                  </div>
                  <p class="card-category">
                    <h3 class="card-title" style="text-align: left; color: #ffffff;">해외 유입
                    </h3><br>
                  </p>
                  <h1 class="card-title" style="text-align: center; color: #ffffff;">${item.overFlowCnt}
                    <small>명</small>
                  </h1><br>
                </div>
              </div>
            </div>
            <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6">
              <div class="card card-stats">
                <div class="card-header card-header-warning card-header-icon">
                  <div class="card-icon">
                    <i class="material-icons">masks</i>
                  </div>
                  <p class="card-category">
                    <h3 class="card-title" style="text-align: left; color: #ffffff;">10만명 당 발생률
                    </h3><br>
                  </p>
                  <h1 class="card-title" style="text-align: center; color: #ffffff;">${item.qurRate} %
                  </h1><br>
                </div>
              </div>
            </div>

            <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6">
              <div class="card card-stats">
                <div class="card-header card-header-success card-header-icon">
                  <div class="card-icon">
                    <i class="material-icons">accessibility_new</i>
                  </div>
                  <p class="card-category">
                    <h3 class="card-title" style="text-align: left; color: #ffffff;">격리 해제
                    </h3><br>
                  </p>
                  <h1 class="card-title" style="text-align: center; color: #ffffff;">${item.isolClearCnt}
                    <small>명</small>
                  </h1><br>
                </div>
              </div>
            </div>

          </div>

          <div class="row">

            <div class="col-xl-6 col-lg-12">
              <div class="card card-chart">
                <div class="card-header card-header-danger">
                  <div class="ct-chart" id="dailySalesChart"></div>
                </div>
                <div class="card-body">
                  <h3 class="card-title">확진자 추이</h3>
                  <p class="card-category">
                    <span class="text-success"><i class="fa fa-long-arrow-up"></i> 55% </span> increase in today sales.
                  </p>
                </div>
                <div class="card-footer">
                </div>
              </div>
            </div>

            <div class="col-xl-6 col-lg-12">
              <div class="card card-chart">
                <div class="card-header card-header-success">
                  <div class="ct-chart" id="completedTasksChart"></div>
                </div>
                <div class="card-body">
                  <h3 class="card-title">전일 대비 증감</h3>
                  <p class="card-category">Last Campaign Performance</p>
                </div>
                <div class="card-footer">
                </div>
              </div>
            </div>
          </div>

          <div class="row">
            <div class="col-lg-12 col-md-12">
              <div class="card">
                <div class="card-header card-header-tabs card-header-warning">
                  <h2 class="card-title">History</h2>
                </div>
                <div class="card-body table-responsive">
                  <table class="table table-hover">
                    <thead class="text-warning" style="text-align: center;">
                      <th>
                        <h3 style="color: #ffffff;">일자</h3>
                      </th>
                      <th>
                        <h3 style="color: #ffffff;">확진자</h3>
                      </th>
                      <th>
                        <h3 style="color: #ffffff;">누적확진자</h3>
                      </th>
                      <th>
                        <h3 style="color: #ffffff;">사망자</h3>
                      </th>
                      <th>
                        <h3 style="color: #ffffff;">격리중</h3>
                      </th>
                      <th>
                        <h3 style="color: #ffffff;">격리해제</h3>
                      </th>
                      <th>
                        <h3 style="color: #ffffff;">전일대비증감</h3>
                      </th>
                    </thead>
                    <tbody id="showHistory" style="text-align: center;">

                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>

        </div>
      </div>
      <div class="copyright float-right" id="date">
        , made with <i class="material-icons">favorite</i> by
        <a href="https://www.creative-tim.com" target="_blank">syjeon@ntels.com</a>
      </div>

    </div>

    <script>
      const x = new Date().getFullYear();
      let date = document.getElementById('date');
      date.innerHTML = '&copy; ' + x + date.innerHTML;
    </script>
  </div>
</div>

  <div class="fixed-plugin">
    <div class="dropdown show-dropdown">
      <a href="#" data-toggle="dropdown">
        <i class="fa fa-cog fa-2x"> </i>
      </a>
      <ul class="dropdown-menu">
        <li class="header-title"> Sidebar Filters</li>
        <li class="adjustments-line">
          <a href="javascript:void(0)" class="switch-trigger active-color">
            <div class="badge-colors ml-auto mr-auto">
              <span class="badge filter badge-purple active" data-color="purple"></span>
              <span class="badge filter badge-azure" data-color="azure"></span>
              <span class="badge filter badge-green" data-color="green"></span>
              <span class="badge filter badge-warning" data-color="orange"></span>
              <span class="badge filter badge-danger" data-color="danger"></span>
            </div>
            <div class="clearfix"></div>
          </a>
        </li>
        <li class="header-title">Images</li>
        <li>
          <a class="img-holder switch-trigger" href="javascript:void(0)">
            <img src="../assets/img/sidebar-1.jpg" alt="">
          </a>
        </li>
        <li class="active">
          <a class="img-holder switch-trigger" href="javascript:void(0)">
            <img src="../assets/img/sidebar-2.jpg" alt="">
          </a>
        </li>
        <li>
          <a class="img-holder switch-trigger" href="javascript:void(0)">
            <img src="../assets/img/sidebar-3.jpg" alt="">
          </a>
        </li>
        <li>
          <a class="img-holder switch-trigger" href="javascript:void(0)">
            <img src="../assets/img/sidebar-4.jpg" alt="">
          </a>
        </li>
        <li class="button-container">
          <a href="https://www.creative-tim.com/product/material-dashboard-dark" target="_blank"
            class="btn btn-primary btn-block">Free Download</a>
        </li>
        <!-- <li class="header-title">Want more components?</li>
            <li class="button-container">
                <a href="https://www.creative-tim.com/product/material-dashboard-pro" target="_blank" class="btn btn-warning btn-block">
                  Get the pro version
                </a>
            </li> -->
        <li class="button-container">
          <a href="https://demos.creative-tim.com/material-dashboard-dark/docs/2.0/getting-started/introduction.html"
            target="_blank" class="btn btn-default btn-block">
            View Documentation
          </a>
        </li>
        <li class="button-container github-star">
          <a class="github-button" href="https://github.com/creativetimofficial/material-dashboard/tree/dark-edition"
            data-icon="octicon-star" data-size="large" data-show-count="true"
            aria-label="Star ntkme/github-buttons on GitHub">Star</a>
        </li>
        <li class="header-title">Thank you for 95 shares!</li>
        <li class="button-container text-center">
          <button id="twitter" class="btn btn-round btn-twitter"><i class="fa fa-twitter"></i> &middot; 45</button>
          <button id="facebook" class="btn btn-round btn-facebook"><i class="fa fa-facebook-f"></i> &middot; 50</button>
          <br>
          <br>
        </li>
      </ul>
    </div>
  </div>
  <!--   Core JS Files   -->
  <script src="../assets/js/core/jquery.min.js"></script>
  <script src="../assets/js/core/popper.min.js"></script>
  <script src="../assets/js/core/bootstrap-material-design.min.js"></script>
  <script src="https://unpkg.com/default-passive-events"></script>
  <script src="../assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <!-- Place this tag in your head or just before your close body tag. -->
  <script async defer src="https://buttons.github.io/buttons.js"></script>
  <!--  Google Maps Plugin    -->
  <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
  <!-- Chartist JS -->
  <script src="../assets/js/plugins/chartist.min.js"></script>
  <!--  Notifications Plugin    -->
  <script src="../assets/js/plugins/bootstrap-notify.js"></script>
  <!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="../assets/js/material-dashboard.js?v=2.1.0"></script>
  <!-- Material Dashboard DEMO methods, don't include it in your project! -->
  <script src="../assets/demo/demo.js"></script>
  <script>
    $(document).ready(function () {
      $().ready(function () {
        $sidebar = $('.sidebar');

        $sidebar_img_container = $sidebar.find('.sidebar-background');

        $full_page = $('.full-page');

        $sidebar_responsive = $('body > .navbar-collapse');

        window_width = $(window).width();

        $('.fixed-plugin a').click(function (event) {
          // Alex if we click on switch, stop propagation of the event, so the dropdown will not be hide, otherwise we set the  section active
          if ($(this).hasClass('switch-trigger')) {
            if (event.stopPropagation) {
              event.stopPropagation();
            } else if (window.event) {
              window.event.cancelBubble = true;
            }
          }
        });

        $('.fixed-plugin .active-color span').click(function () {
          $full_page_background = $('.full-page-background');

          $(this).siblings().removeClass('active');
          $(this).addClass('active');

          var new_color = $(this).data('color');

          if ($sidebar.length != 0) {
            $sidebar.attr('data-color', new_color);
          }

          if ($full_page.length != 0) {
            $full_page.attr('filter-color', new_color);
          }

          if ($sidebar_responsive.length != 0) {
            $sidebar_responsive.attr('data-color', new_color);
          }
        });

        $('.fixed-plugin .background-color .badge').click(function () {
          $(this).siblings().removeClass('active');
          $(this).addClass('active');

          var new_color = $(this).data('background-color');

          if ($sidebar.length != 0) {
            $sidebar.attr('data-background-color', new_color);
          }
        });

        $('.fixed-plugin .img-holder').click(function () {
          $full_page_background = $('.full-page-background');

          $(this).parent('li').siblings().removeClass('active');
          $(this).parent('li').addClass('active');


          var new_image = $(this).find("img").attr('src');

          if ($sidebar_img_container.length != 0 && $('.switch-sidebar-image input:checked').length != 0) {
            $sidebar_img_container.fadeOut('fast', function () {
              $sidebar_img_container.css('background-image', 'url("' + new_image + '")');
              $sidebar_img_container.fadeIn('fast');
            });
          }

          if ($full_page_background.length != 0 && $('.switch-sidebar-image input:checked').length != 0) {
            var new_image_full_page = $('.fixed-plugin li.active .img-holder').find('img').data('src');

            $full_page_background.fadeOut('fast', function () {
              $full_page_background.css('background-image', 'url("' + new_image_full_page + '")');
              $full_page_background.fadeIn('fast');
            });
          }

          if ($('.switch-sidebar-image input:checked').length == 0) {
            var new_image = $('.fixed-plugin li.active .img-holder').find("img").attr('src');
            var new_image_full_page = $('.fixed-plugin li.active .img-holder').find('img').data('src');

            $sidebar_img_container.css('background-image', 'url("' + new_image + '")');
            $full_page_background.css('background-image', 'url("' + new_image_full_page + '")');
          }

          if ($sidebar_responsive.length != 0) {
            $sidebar_responsive.css('background-image', 'url("' + new_image + '")');
          }
        });

        $('.switch-sidebar-image input').change(function () {
          $full_page_background = $('.full-page-background');

          $input = $(this);

          if ($input.is(':checked')) {
            if ($sidebar_img_container.length != 0) {
              $sidebar_img_container.fadeIn('fast');
              $sidebar.attr('data-image', '#');
            }

            if ($full_page_background.length != 0) {
              $full_page_background.fadeIn('fast');
              $full_page.attr('data-image', '#');
            }

            background_image = true;
          } else {
            if ($sidebar_img_container.length != 0) {
              $sidebar.removeAttr('data-image');
              $sidebar_img_container.fadeOut('fast');
            }

            if ($full_page_background.length != 0) {
              $full_page.removeAttr('data-image', '#');
              $full_page_background.fadeOut('fast');
            }

            background_image = false;
          }
        });

        $('.switch-sidebar-mini input').change(function () {
          $body = $('body');

          $input = $(this);

          if (md.misc.sidebar_mini_active == true) {
            $('body').removeClass('sidebar-mini');
            md.misc.sidebar_mini_active = false;

            $('.sidebar .sidebar-wrapper, .main-panel').perfectScrollbar();

          } else {

            $('.sidebar .sidebar-wrapper, .main-panel').perfectScrollbar('destroy');

            setTimeout(function () {
              $('body').addClass('sidebar-mini');

              md.misc.sidebar_mini_active = true;
            }, 300);
          }

          // we simulate the window Resize so the charts will get updated in realtime.
          var simulateWindowResize = setInterval(function () {
            window.dispatchEvent(new Event('resize'));
          }, 180);

          // we stop the simulation of Window Resize after the animations are completed
          setTimeout(function () {
            clearInterval(simulateWindowResize);
          }, 1000);

        });
      });
    });
  </script>
</body>

</html>