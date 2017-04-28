<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Post;
use App\Comment;
use Auth;

class CommentController extends Controller
{
    public function addComment(Request $request, $post_id)
	{
		$this->validate(request(), [
			'body' => 'required|max:1000'
		]);
		$comment = new Comment();
		$comment->body = $request->body;
		$comment->user_id = Auth::user()->id;
		$comment->post_id = $post_id;
		$comment->save();

		return redirect('home');
	}

	public function deleteComment($comment_id)
	{
		$delete_comment = Comment::find($comment_id);
		$delete_comment->delete();

		return redirect('home');
	}

	public function editComment(Request $request, $comment_id) 
   	{
   		$edit_comment = Comment::find($comment_id);
   		$edit_comment->body = $request->body;
   		$edit_comment->save();	

   		return redirect('home');
   	}
}
