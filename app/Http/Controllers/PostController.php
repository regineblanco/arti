<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Post; 
use App\Like;
use Session;
use Auth;

class PostController extends Controller
{

	// public function __construct() {
	// 	$this->middleware('auth');
	// }

	public function showDashboard()
	{
		$posts = Post::all();
		$posts = $posts->sortByDesc('created_at');

	   	return view('home', ['posts' => $posts]);	
	}

	public function createPost(Request $request)
	{
		//validation
		$this->validate(request(), [
			'body' => 'required'
		]);
		$post = new Post();
		$post->body = $request->body;
		$post->user_id = Auth::user()->id;
		$post->save();
		Session::flash('message','you have created your post');

		return redirect('home');
	}

	public function deletePost($post_id)
	{
		$delete_post = Post::find($post_id);
		$delete_post->delete();
		Session::flash('message','post deleted');

		return redirect('home');
	}

	// public function editPost($post_id)
	// {
	// 	$edit_post = Post::find($post_id);

	// 	return view('articles/edit', compact('edit_post'));
	// }

   	public function editPost(Request $request, $post_id) 
   	{
   		$edit_post = Post::find($post_id);
   		$edit_post->body = $request->body;
   		$edit_post->save();
   		Session::flash('message','edit successful!');

   		return redirect('home');
   	}

   	// public function showProfile()
   	// {
   	// 	$posts = Auth::user()->posts;
   	// 	$posts = $posts->sortByDesc('created_at');

   	// 	$profile = Auth::user();
   	// 	return view('profile', compact('profile','posts'));
   	// }

   	public function likePost(Request $request)
    {
        $post_id = $request['postId'];
        $is_like = $request['isLike'] === 'true';
        $update = false;
        $post = Post::find($post_id);
        
        if (!$post) {
            return "error";
        }
        $user = Auth::user();

        $like = $user->likes()->where('post_id', $post_id)->first();

        if ($like) {
        	$already_like = $like->like;
        	$update = true;
        	if ($already_like == $is_like) {
        		$like->delete();
        		return null;
        	}
        } else {
        	$like = new Like();
        }
        $like->like = $is_like;
        $like->user_id = $user->id;
        $like->post_id = $post->id;
        if ($update) {
        	$like->update();
        } else {
        	$like->save();
        }
        return null;
    }
}