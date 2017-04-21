<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Post;
use Auth;

class PostController extends Controller
{

	public function showDashboard()
	{
		$posts = Post::all();
		$posts = $posts->sortByDesc('created_at');
	   	return view('home', ['posts' => $posts]);	
	}

	public function createPost(Request $request)
	{
		//validation
		$post = new Post();
		$post->body = $request->body;
		$post->user_id = Auth::user()->id;
		$post->save();

		return redirect('home');
	}

	public function deletePost($post_id)
	{
		$delete_post = Post::find($post_id);
		$delete_post->delete();

		return redirect('home');
	}
}