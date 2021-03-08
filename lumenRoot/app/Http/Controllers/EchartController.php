<?php
/**
 * Created by PhpStorm.
 * @author tann1013@hotmail.com
 * @date 2021-03-08
 * @version 1.0
 */

namespace App\Http\Controllers;


class EchartController extends Controller
{
    public function module(){
        $echartOption = $this->_optionOne();//echartOption
        return view('moduleIndex', ['echartOption' => $echartOption]);
    }


    /**
     * 多维条形图
     *
     * @return string
     */
    private function _optionTwo(){
        $html = <<<eof
    // 指定图表的配置项和数据
    var optionOne = {
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
     * 多维条形图
     *
     * @return string
     */
    private function _optionOne(){
        $html = <<<eof
    var optionTwo = {
        legend: {},
        tooltip: {},
        dataset: {
            source: [
                ['product', '2015', '2016', '2017'],
                ['Matcha Latte', 43.3, 85.8, 93.7],
                ['Milk Tea', 83.1, 73.4, 55.1],
                ['Cheese Cocoa', 86.4, 65.2, 82.5],
                ['Walnut Brownie', 72.4, 53.9, 39.1]
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

}