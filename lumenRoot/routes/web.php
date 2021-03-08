<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$router->get('/', 'BlogsController@getList');


//$router->get('/', function () use ($router) {
//    //return $router->app->version();
//    return view('index', ['name' => '学院君']);
//});

$router->get('/about', function () use ($router) {
    //return $router->app->version();
    return view('about', ['name' => '学院君']);
});

$router->get('/content', function () use ($router) {
    //return $router->app->version();
    return view('content', ['name' => '学院君']);
});

//记账app
$router->get('/app/jz', function () use ($router) {
    //return $router->app->version();
    return view('jz', ['name' => '学院君']);
});

//新增后台入口:http://admindev.com/admini
$router->get('/admini', function () use ($router) {
    //return $router->app->version();
    //return view('jz', ['name' => '学院君']);
});
//新增组件模块 module
$router->get('/module', function () use ($router) {
    //return $router->app->version();
    return view('moduleIndex', ['name' => '学院君']);
});
