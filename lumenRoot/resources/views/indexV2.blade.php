<!DOCTYPE html>
<html lang="cn" dir="ltr" class="no-js">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="maximum-scale=1.0,width=device-width,initial-scale=1.0,user-scalable=no">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <title>蜗牛工作室-专注微信小程序 APP 各行业管理后台系统等整体解决方案服务</title>
    <link href="./assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/css/style.css" rel="stylesheet" />
    <link href="assets/css/nprogress.css" rel="stylesheet" />
    <link rel="stylesheet" href="assets/css/nivo-slider.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="assets/css/default.css" type="text/css" media="screen" />
    <script src="assets/js/jquery.min.js"></script>
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
            <span class="icon-bmenu_linkar">
            </span>
            <span class="icon-bar">
            </span>
            <span class="icon-bar">
            </span>
            </button>
            <a class="navbar-brand" href="/">
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
                {{--<li>--}}
                    {{--<a href="blog.html">--}}
                        {{--博客--}}
                    {{--</a>--}}
                {{--</li>--}}
                {{--<li>--}}
                    {{--<a href="works.html">--}}
                        {{--作品--}}
                    {{--</a>--}}
                {{--</li>--}}
                {{--<li>--}}
                    {{--<a href="links.html">--}}
                        {{--链接--}}
                    {{--</a>--}}
                {{--</li>--}}
                {{--<li>--}}
                    {{--<a href="contact.html">--}}
                        {{--联系--}}
                    {{--</a>--}}
                {{--</li>--}}
                {{--<li>--}}
                    {{--<a href="help.html">--}}
                        {{--帮助--}}
                    {{--</a>--}}
                {{--</li>--}}
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
<!--主要内容 -->
    <div class="container-fluid main-container" id="main-container">
        <div class="row top-title">
            <div class="col-md-12">
                <h1 class="page-title">
                    最新文章
                </h1>
            </div>
        </div>
    <!--main Start-->
            @foreach($data['rows'] as $key=>$value)
            <div class="row">
                <div class="col-md-12 post-container">
                    <h2 class="post-title">
                        <a href="content?id=<?=$value['id']?>" title="">
                            <?php echo $value['title']?>
                        </a>
                    </h2>
                    <div class="meta-box">
            <span class="m-post-date">
              <i class="fa fa-calendar-o">
              </i>
              <?php echo date('Y-m-d H:i:s',$value['create_time'])?>
            </span>
                        <span class="comments-link">
              <a href="" class="ds-thread-count" data-thread-key="9500" title="Comment on 毕业两周年">
                  <i class="fa fa-comments-o">
                  </i>
                  留言
              </a>
            </span>
                    </div>
                    <div class="post-content">
                        <p><?php echo $value['intro']?></p>
                    </div>
                    <div class="meta-box">
            <span class="cat-links">
              <i class="fa fa-navicon">
              </i>
              <b>
                  分类:
              </b>
              <a href="topics/life/diary.htm">
                  博客
              </a>
            </span>
                        <span class="tag-links">
              <i class="fa fa-tags">
              </i>
              <b>
                  标签:
              </b>
              <a href="tags/毕业.htm" rel="tag">
                  <?php echo $value['tags'] ? $value['tags'] : '暂无'?>
              </a>
            </span>
                    </div>
                </div>
            </div>
            @endforeach
    <!--更多内容-->
    <div class="row">
        <div class="col-md-12">
            <h2 class="page-title">
                <a href="blog.html" title="">更多内容</a>
            </h2>
        </div>
    </div>
    <!--跳转至博客页面-->
    <div class="row">
        <div class="col-md-12 post-container">
            <div class="row">
                <div class="col-md-4">
                    <a class="btn btn-primary home-browser-more-btn" href="blog.html">
                        <span>浏览更多文章</span>
                    </a>
                </div>
                <div class="col-md-8">
                </div>
            </div>
        </div>
    </div>
    <!--推荐阅读-->
    <div class="row">
        <div class="col-md-12 post-container m-recommend-page">
            <div class="row">
                <div class="col-md-4">
                    <a href="" class="thumbnail">
                        <img src="assets/img/works.png" alt="作品展示">
                    </a>
                </div>
                <div class="col-md-4">
                    <a href="" class="thumbnail">
                        <img src="assets/img/about.png" alt="路人简介">
                    </a>
                </div>
                <div class="col-md-4">
                    <a href="" class="thumbnail">
                        <img src="assets/img/book.png" alt="作品推荐">
                    </a>
                </div>
            </div>
        </div>
    </div>
    <!-- 网站底部 -->
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