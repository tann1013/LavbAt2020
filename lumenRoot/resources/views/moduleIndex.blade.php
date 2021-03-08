<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>第一个 ECharts 实例</title>
    <!-- 引入 echarts.js -->
    <script src="https://cdn.staticfile.org/echarts/4.3.0/echarts.min.js"></script>
    {{--<script src="echart/echarts.min.js"></script>--}}
</head>
<body>
<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
<div id="main" style="width: 600px;height:400px;"></div>
<script type="text/javascript">

    //1 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));
    //2 指定图表的配置项和数据
    <?=$echartOption?>
    //3 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
</script>
</body>
</html>