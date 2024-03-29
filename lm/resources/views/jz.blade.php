<?php
$config = array(
    'version'=>'3.3',
    'name'   => 'TallyBook-V3.3',
    'desc' => '补充工资收入',
);
?>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="generator" content="Editplus4PHP" />
    <meta name="keywords" content="<?php echo $config['name']?>" />
    <meta name="description" content="<?php echo $config['name']?>" />
    <meta name="author" content="Leo" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no" id="viewport" />
    <link rel="shortcut icon" href="images/favicon.ico" />
    <title><?php echo $config['name']?></title>
    <script src="../assets/js/jquery.min.js"></script>
    <style type="text/css">

        .banner {height:100px;width:100%;color: red;background: mediumslateblue;font-size:20px;}
        #message {width:100%;height: 50px;font-size: 20px;background: deepskyblue;text-align:center;color: red;}
        .cell {float:left;width:100%;height:50px;border-bottom: solid 10px darkgray;font-size:20px;background: deepskyblue;color: white}
        .title {float:left;width:30%;height:50px;font-size:20px;}
        .content {float:left;width:70%;height:30px;}
        .input {height:50px;width:100%;font-size:20px;}

    </style>

</head>
<body>
<div class="banner">
    <center><h3 style="color:white"><?php echo $config['name']?></h3></center>
</div>
<div id="message" style=""></div>
<div class="form_zone" style="height:300px;width:100%;">
    <div class="cell">
        <div class="title">日期</div>
        <div class="content"><input type="text" class="input" name="addtime" value="<?php echo date('Y-m-d',time())?>"/></div>
    </div>
    <div class="cell">
        <div class="title">①吃饭</div>
        <div class="content"><input type="text" class="input" name="op_eat" /></div>
    </div>
    <div class="cell">
        <div class="title">②交通</div>
        <div class="content"><input type="text" class="input" name="op_traffic"/></div>
    </div>
    <div class="cell">
        <div class="title">③其他</div>
        <div class="content"><input type="text" class="input" name="op_other"/></div>
    </div>
    <div class="cell">
        <div class="title">④其他备注</div>
        <div class="content">
            <input type="text" class="input" name="op_other_notes"  placeholder="其他的备注" />
        </div>
    </div>
    <div class="cell">
        <div class="title">支出</div>
        <div class="content"><input type="text" class="input" name="total" style="color: red"/></div>
    </div>
    <hr style="background: dodgerblue;height: 10px";>
    <div class="cell" style="background: #1abc9c">
        <div class="title">①收益/￥</div>
        <div class="content"><input type="text" class="input" name="op_today_profit"/></div>
    </div>
    <div class="cell" style="background: #1abc9c">
        <div class="title">①收益备注</div>
        <div class="content">
            <input type="text" class="input" name="op_today_profit_notes" placeholder="收益备注（理财或顺风车等）" value="顺风车"/>
        </div>
    </div>
    <div class="cell" style="background: #1abc9c">
        <div class="title">②读书/min</div>
        <div class="content"><input type="text" class="input" name="op_today_reading"/></div>
    </div>
    <div class="cell" style="background: #1abc9c">
        <div class="title">③Runiing/km</div>
        <div class="content"><input type="text" class="input" name="op_today_running"/></div>
    </div>
    <div class="cell" style="background: #1abc9c">
        <div class="title">④Situp/个</div>
        <div class="content"><input type="text" class="input" name="op_today_situp"/></div>
    </div>
    <div class="cell" style="background: #b0413e">
        <div class="title">①工资/￥</div>
        <div class="content"><input type="text" class="input" name="every_month_wages" placeholder="发工资再填写"/></div>
    </div>
    <div class="cell" style="background: cadetblue">
        <div class="title"><button style="height: 50px;font-size:30px;color:white;width: 100%;background: steelblue">历史</button></div>
        <div class="content"><input type="submit" value="提交当天数据" style="height: 50px;font-size:30px;color:white;width: 100%;color: black;background: cornflowerblue"></div>
    </div>
</div>
<div class="banner">
</div>

</body>
</html>
<script type="text/javascript">
    $('.form_zone input[type=submit]').click(function(){
        //config
        var every_limit = 50;//每天最大预算
        var addtime    = $('.form_zone input[name=addtime]').val();
        var op_eat     = $('.form_zone input[name=op_eat]').val();
        var op_traffic = $('.form_zone input[name=op_traffic]').val();
        var op_other   = $('.form_zone input[name=op_other]').val();
        var op_today_profit        = $('.form_zone input[name=op_today_profit]').val();
        var op_today_profit_notes  = $('.form_zone input[name=op_today_profit_notes]').val();
        var op_today_reading = $('.form_zone input[name=op_today_reading]').val();
        var op_today_running = $('.form_zone input[name=op_today_running]').val();
        var op_other_notes   = $('.form_zone input[name=op_other_notes]').val();
        var every_month_wages = $('.form_zone input[name=every_month_wages]').val();//补充工资收入

        //计算total
        var total =  parseInt(op_eat)+parseInt(op_traffic)+parseInt(op_other);
        //超支金额
        var over_num =  total-every_limit;
        if(isNaN(total)){total = 0;}

        $('.form_zone input[name=total]').val(total);
        //超出预算提示！
        if(total > every_limit){
            //$('#message').html('<span style="color: red">您已经超支！</span>');
            alert('您今天已经超支￥'+over_num+'，请注意节省！');
        }else{
            $('#message').html('<span style="color: green">恭喜您，请明天继续保持！</span>');
        }
        //alert(op_traffic);
        //测试数据
        //    op_eat = 10,
        //    op_traffic = 10,
        //    op_other = 1000;
        //    op_today_profit = -100;
        //    op_today_reading = 30;
        //    op_today_running = 60;

        if(op_eat != '' && op_traffic != '' && op_today_profit != '' && op_today_reading != '' && op_today_running != '' && addtime!= ''){
            $.post('/admin/jz',{
                'addtime':addtime,
                'op_eat':op_eat,
                'op_traffic':op_traffic,
                'op_other':op_other,
                'op_other_notes':op_other_notes,
                'total':total,
                'op_today_profit':op_today_profit,
                'op_today_profit_notes':op_today_profit_notes,
                'op_today_reading':op_today_reading,
                'op_today_running':op_today_running,
                'every_month_wages':every_month_wages
            },function(data){
                if(data.code = '200'){
                    $('#message').html(data.msg);
                }if(data.code = '400'){
                    $('#message').html(data.msg);
                }if(data.code = '401'){
                    $('#message').html(data.msg);
                }if(data.code = '402'){
                    $('#message').html(data.msg);
                }
            },'json');
        }else{
            $('#message').html("<p style='font-size: 15px;text-align: left'>吃饭、交通、每日收益、读书和跑步必须有值！</p>");
            //alert('吃饭、交通、每日收益、读书和跑步必须有值！');
        }
    });
</script>