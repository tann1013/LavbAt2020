<?php
/**
 * 说明：
 * 1 主要图形：
 * 1.1 条形图（单个或多个）
 * 1.2 折线（单个或多个）
 *
 *
 * Created by PhpStorm.
 * @author tann1013@hotmail.com
 * @date 2021-03-08
 * @version 1.0
 */

namespace App\Http\Controllers;



class EchartController extends Controller
{
    public function module(){
        //$echartOption = $this->_optionSingleBar();
        $echartOption = $this->_optionMultBar();
        //$echartOption = $this->_pipe();//echartOption
        //$echartOption = $this->_optionSingleLine();
        //$echartOption = $this->_optionMultiLine();

        return view('moduleIndex', ['echartOption' => $echartOption]);
    }

    /**
     *单个条形图
     *
     * @return string
     */
    private function _optionSingleBar(){
        $html = <<<eof
    // 指定图表的配置项和数据
    var option = {
        title: {
            text: '第一个 ECharts 实例'
        },
        tooltip: {},
        legend: {
            data:['销量']
        },
        xAxis: {
            data: ["衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"]
        },
        yAxis: {},
        series: [{
            name: '销量',
            type: 'bar',
            data: [5, 20, 36, 10, 10, 20]
        }]
    };
eof;
        return $html;
    }

    /**
     * 多个条形图
     * https://echarts.apache.org/v4/examples/zh/editor.html?c=dataset-simple0
     *
     * @return string
     */
    private function _optionMultBar(){
        $html = <<<eof
    var option = {
        legend: {},
        tooltip: {},
        dataset: {
            source: [
                ['type', 'SO2', '烟尘', '污水'],
                ['一月', 43.3, 85.8, 93.7],
                ['二月', 83.1, 73.4, 55.1],
                ['三月', 86.4, 65.2, 82.5],
                ['四月', 72.4, 53.9, 39.1]
            ]
        },
        xAxis: {type: 'category'},
        yAxis: {},
        // Declare several bar series, each will be mapped
        // to a column of dataset.source by default.
        series: [
            {type: 'bar'},
            {type: 'bar'},
            {type: 'bar'}
        ]
    };
eof;
        return $html;
    }

    /**
     * 饼图
     *
     * @return string
     */
    private function _pipe(){
        $html = <<<eof
option = {
    backgroundColor: '#2c343c',

    title: {
        text: 'Customized Pie',
        left: 'center',
        top: 20,
        textStyle: {
            color: '#ccc'
        }
    },

    tooltip: {
        trigger: 'item',
        formatter: '{a} <br/>{b} : {c} ({d}%)'
    },

    visualMap: {
        show: false,
        min: 80,
        max: 600,
        inRange: {
            colorLightness: [0, 1]
        }
    },
    series: [
        {
            name: '访问来源',
            type: 'pie',
            radius: '55%',
            center: ['50%', '50%'],
            data: [
                {value: 335, name: '直接访问'},
                {value: 310, name: '邮件营销'},
                {value: 274, name: '联盟广告'},
                {value: 235, name: '视频广告'},
                {value: 400, name: '搜索引擎'}
            ].sort(function (a, b) { return a.value - b.value; }),
            roseType: 'radius',
            label: {
                color: 'rgba(255, 255, 255, 0.3)'
            },
            labelLine: {
                lineStyle: {
                    color: 'rgba(255, 255, 255, 0.3)'
                },
                smooth: 0.2,
                length: 10,
                length2: 20
            },
            itemStyle: {
                color: '#c23531',
                shadowBlur: 200,
                shadowColor: 'rgba(0, 0, 0, 0.5)'
            },

            animationType: 'scale',
            animationEasing: 'elasticOut',
            animationDelay: function (idx) {
                return Math.random() * 200;
            }
        }
    ]
};
eof;
        return $html;

    }

    private function _optionSingleLine(){
        $html = <<<eof
        option = {
    xAxis: {
        type: 'category',
        data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
    },
    yAxis: {
        type: 'value'
    },
    series: [{
        data: [150, 230, 224, 218, 135, 147, 260],
        type: 'line'
    }]
};
eof;
        return $html;
    }

    private function _optionMultiLine(){
        $html = <<<eof
        option = {
    title: {
        text: '折线图堆叠'
    },
    tooltip: {
        trigger: 'axis'
    },
    legend: {
        data: ['SO2', '烟尘', '污水']
    },
    grid: {
        left: '3%',
        right: '4%',
        bottom: '3%',
        containLabel: true
    },
    toolbox: {
        feature: {
            saveAsImage: {}
        }
    },
    xAxis: {
        type: 'category',
        boundaryGap: false,
        data: ['周一', '周二', '周三', '周四', '周五', '周六', '周日']
    },
    yAxis: {
        type: 'value'
    },
    series: [
        {
            name: 'SO2',
            type: 'line',
            stack: '总量',
            data: [120, 132, 101, 134, 90, 230, 210]
        },
        {
            name: '烟尘',
            type: 'line',
            stack: '总量',
            data: [220, 182, 191, 234, 290, 330, 310]
        },
        {
            name: '污水',
            type: 'line',
            stack: '总量',
            data: [150, 232, 201, 154, 190, 330, 410]
        }
    ]
};
eof;
        return $html;
    }
}