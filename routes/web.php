<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Route::group(['middleware' => ['web']], function() {

// 	Route::get('/', function() {
// 		return view('welcome');
// 	});

	Route::get('/welcome', function () {
	    return view('welcome');
	});

	Route::get('/', 'HomeController@index');

	Auth::routes();

	Route::get('/home', 'PostController@showDashboard');

	Route::post('/createpost','PostController@createPost');

	Route::get('/home/{id}/delete', 'PostController@deletePost');

	Route::post('/editpost/{id}', 'PostController@editPost');

	Route::post('/addcomment/{id}','CommentController@addComment');

	Route::get('/home/{id}/deletecomment', 'CommentController@deleteComment');

	Route::post('/editcomment/{id}', 'CommentController@editcomment');

	Route::post('/addphoto','PhotoController@addPhoto');

	Route::get('/profile', 'ProfileController@showProfile');

	Route::get('/profile/{id}', 'ProfileController@showOtherProfile');

	Route::post('/editprofile', 'ProfileController@editProfile');

	Route::post('/like', 'PostController@likePost');

// });

