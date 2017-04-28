<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use App\Post;
use App\Comment;
use App\Photo;
use Session;
use File;
use Auth;

class PhotoController extends Controller
{

	// function uploadPhoto(Request $request) 
	// {

 //        $file = $request->file('photo');
 //        $ext = $file->guessClientExtension();
 //        $filename = 'photo'.Auth::user()->id.".$ext";

 //        if($file) {
 //            Storage::disk('local')->put($filename, File::get($file));
 //            // $user_profile = Auth::user()->profile;
 //            // $user_profile->avatar_src = $filename;
 //            // $user_profile->save();
 //        }

 //        return redirect('home');
 //    }

	public function addPhoto(Request $request)
	{
		//validation
		$file = $request->file('photo');
        $ext = $file->guessClientExtension();
        

        if($file) {
        	$post = new Post();
			$post->user_id = Auth::user()->id;
			$post->save();

			$filename = 'photo'.$post->id.".$ext";

            Storage::disk('local')->put($filename, File::get($file));
            // $user_profile = Auth::user()->profile;
            // $user_profile->avatar_src = $filename;
            // $user_profile->save();

			$photo = new Photo();
			$photo->post_id = $post->id;
			$photo->photo = $filename;
			$photo->caption = $request->caption;
			$photo->user_id = Auth::user()->id;
			$photo->save();
			Session::flash('message','you have created your post');
        }

		return redirect('home');
	}    
}
