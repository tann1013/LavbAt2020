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
    myChart.setOption(optionTwo);

    //import * as echarts from 'echarts';

    // var app = {};
    //
    // var chartDom = document.getElementById('main');
    // var myChart = echarts.init(chartDom);
    // var option;
    //
    // var posList = [
    //     'left', 'right', 'top', 'bottom',
    //     'inside',
    //     'insideTop', 'insideLeft', 'insideRight', 'insideBottom',
    //     'insideTopLeft', 'insideTopRight', 'insideBottomLeft', 'insideBottomRight'
    // ];
    //
    // app.configParameters = {
    //     rotate: {
    //         min: -90,
    //         max: 90
    //     },
    //     align: {
    //         options: {
    //             left: 'left',
    //             center: 'center',
    //             right: 'right'
    //         }
    //     },
    //     verticalAlign: {
    //         options: {
    //             top: 'top',
    //             middle: 'middle',
    //             bottom: 'bottom'
    //         }
    //     },
    //     position: {
    //         options: posList.reduce(function (map, pos) {
    //             map[pos] = pos;
    //             return map;
    //         }, {})
    //     },
    //     distance: {
    //         min: 0,
    //         max: 100
    //     }
    // };
    //
    // app.config = {
    //     rotate: 90,
    //     align: 'left',
    //     verticalAlign: 'middle',
    //     position: 'insideBottom',
    //     distance: 15,
    //     onChange: function () {
    //         var labelOption = {
    //             normal: {
    //                 rotate: app.config.rotate,
    //                 align: app.config.align,
    //                 verticalAlign: app.config.verticalAlign,
    //                 position: app.config.position,
    //                 distance: app.config.distance
    //             }
    //         };
    //         myChart.setOption({
    //             series: [{
    //                 label: labelOption
    //             }, {
    //                 label: labelOption
    //             }, {
    //                 label: labelOption
    //             }, {
    //                 label: labelOption
    //             }]
    //         });
    //     }
    // };
    //
    //
    // var labelOption = {
    //     show: true,
    //     position: app.config.position,
    //     distance: app.config.distance,
    //     align: app.config.align,
    //     verticalAlign: app.config.verticalAlign,
    //     rotate: app.config.rotate,
    //     formatter: '{c}  {name|{a}}',
    //     fontSize: 16,
    //     rich: {
    //         name: {
    //         }
    //     }
    // };
    //
    // option = {
    //     tooltip: {
    //         trigger: 'axis',
    //         axisPointer: {
    //             type: 'shadow'
    //         }
    //     },
    //     legend: {
    //         data: ['Forest', 'Steppe', 'Desert', 'Wetland']
    //     },
    //     toolbox: {
    //         show: true,
    //         orient: 'vertical',
    //         left: 'right',
    //         top: 'center',
    //         feature: {
    //             mark: {show: true},
    //             dataView: {show: true, readOnly: false},
    //             magicType: {show: true, type: ['line', 'bar', 'stack', 'tiled']},
    //             restore: {show: true},
    //             saveAsImage: {show: true}
    //         }
    //     },
    //     xAxis: [
    //         {
    //             type: 'category',
    //             axisTick: {show: false},
    //             data: ['2012', '2013', '2014', '2015', '2016']
    //         }
    //     ],
    //     yAxis: [
    //         {
    //             type: 'value'
    //         }
    //     ],
    //     series: [
    //         {
    //             name: 'Forest',
    //             type: 'bar',
    //             barGap: 0,
    //             label: labelOption,
    //             emphasis: {
    //                 focus: 'series'
    //             },
    //             data: [320, 332, 301, 334, 390]
    //         },
    //         {
    //             name: 'Steppe',
    //             type: 'bar',
    //             label: labelOption,
    //             emphasis: {
    //                 focus: 'series'
    //             },
    //             data: [220, 182, 191, 234, 290]
    //         },
    //         {
    //             name: 'Desert',
    //             type: 'bar',
    //             label: labelOption,
    //             emphasis: {
    //                 focus: 'series'
    //             },
    //             data: [150, 232, 201, 154, 190]
    //         },
    //         {
    //             name: 'Wetland',
    //             type: 'bar',
    //             label: labelOption,
    //             emphasis: {
    //                 focus: 'series'
    //             },
    //             data: [98, 77, 101, 99, 40]
    //         }
    //     ]
    // };
    //
    // option && myChart.setOption(option);

</script>
</body>
</html>