<!DOCTYPE html>
<html lang="cn" dir="ltr" class="no-js">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="maximum-scale=1.0,width=device-width,initial-scale=1.0,user-scalable=no">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <title><?php echo $detail['title']?></title>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/css/style.css" rel="stylesheet" />
    <link href="assets/css/nprogress.css" rel="stylesheet" />
    <link rel="stylesheet" href="assets/css/nivo-slider.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="assets/css/default.css" type="text/css" media="screen" />
    <script src="assets/js/jquery.min.js"></script>
    <link rel="stylesheet" href="assets/APlayer/dist/APlayer.min.css">
    <script src="assets/js/jquery.nivo.slider.pack.js"></script>
    <script src="assets/js/nprogress.js"></script>
</head>

<body>
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
            <span class="sr-only">
              Toggle navigation
            </span>
            <span class="icon-bar">
            </span>
            <span class="icon-bar">
            </span>
            <span class="icon-bar">
            </span>
            </button>
            <a class="navbar-brand" href="index.html">
                <img src="assets/img/logo.png" class="logo"/>
            </a>
        </div>
        <div class="collapse navbar-collapse " id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav header-menu">
                <li>
                    <a href="/">
                        首页
                    </a>
                </li>
                <li>
                    <a href="about">
                        关于
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="leftbar">
    <!-- 左菜单 -->
    <div class="left_menu"></div>
</div>
<!--Start banner img-->
<div class="container-filed" id="banner_container">
    <div class="row">
        <div class="col-md-12">
            <div class="slider-wrapper theme-default">
                <div id="slider" class="nivoSlider">
                    <img src="assets/img/owl.jpg" data-thumb="assets/img/owl.jpg" alt="" />
                    <a href="assets/img/owl2.jpg"><img src="assets/img/owl2.jpg" alt="" /></a>
                    <img src="assets/img/owl.jpg" data-thumb="assets/img/owl.jpg" alt="" />
                    <img src="assets/img/owl2.jpg" data-thumb="assets/img/owl2.jpg" alt="" />
                </div>
            </div>
        </div>
    </div>
</div>
<!--End banner img-->
<div class="container-fluid main-container" id="main-container">
    <div class="row top-title">
        <div class="col-md-12">
            <h1 class="page-title right">
                <a href="/">博客</a> >> <a href="content.html">博客详情</a>
            </h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 post-container">
            <h2 class="post-title">
                <a href="booklist.htm" tppabs="http://www.soulteary.com/booklist" rel="bookmark">
                    <?php echo $detail['title']?>
                </a>
            </h2>
            <div class="meta-box">
            </div>
            <div class="post-content">
                <p><?php echo $detail['intro']?></p>
                <hr/>
                <section>
                    <div class="main-container">
                        <div class="row">
                            <p><?php echo $detail['content']?></p>
                            <div id="player3" class="aplayer" style="display: none"></div>
                        </div>
                    </div>
                </section>
                <div class="meta-box">
                </div>
            </div>
        </div>
    </div>
    <footer>
        <!--版权信息-->
        <div class="copyright">
            蜗牛工作室  © 2020
            <a href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=100" target="_blank">浙ICP备2020043071号</a>
            </a>

        </div>
    </footer>
</div>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/APlayer/dist/APlayer.min.js"></script>
<script src="assets/APlayer/demo/demo.js"></script>
<script>
        /*banner 初始化*/
        $(window).load(function() {
         $('#slider').nivoSlider({
            effect: 'random',        // 过渡效果
            controlNav: false,       // 是否显示图片导航控制按钮（,2,3... ）
            pauseOnHover: true,      // 鼠标县浮时是否停止动画
            manualAdvance: false,    // 是否手动切换 
            animSpeed: 100,          // 图片过渡时间   
            pauseTime: 2000,         // 图片显示时间
            pauseOnHover: false,
            manualAdvance: false,
        });
        });
    $(document).ready(function(){
        $('body').show();
        $('.version').text(NProgress.version);
        NProgress.start();
        setTimeout(function() { NProgress.done(); $('.fade').removeClass('out'); }, 1000);
    })
    
</script>
</body>

</html>