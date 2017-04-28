<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use App\Post;
use App\Comment;
use App\Photo;
use App\User;
use File;
use Auth;

class ProfileController extends Controller 
{

	public function showProfile()
 	{
 		$posts = Auth::user()->posts;
 		$posts = $posts->sortByDesc('created_at');

 		$profile = Auth::user();

 		$default_image = "/img/default_image.png";

 		return view('profile', compact('profile','posts','default_image'));
 	}

  public function showOtherProfile($profile_id)
  {
    $posts = User::find($profile_id)->posts;
    $posts = $posts->sortByDesc('created_at');

    $profile = User::find($profile_id);

    $default_image = "/img/default_image.png";

    return view('profile', compact('profile','posts','default_image'));
  }

	public function editProfile(Request $request)
	{
		// $this->validate(request(), [
		// 	'body' => 'required'
		// ]);
		$profile = Auth::user();
		$profile->bio = $request->bio;
		// $profile->user_id = Auth::user()->id;
		$profile->save();

		$file = $request->file('image');
        

        if($file) {
            $ext = $file->guessClientExtension();
            $filename = 'image'.Auth::user()->id.".$ext";
            Storage::disk('local')->put($filename, File::get($file));
            // $profile = Auth::user()->image;
            $profile->image = $filename;
            $profile->save();
        }

        return redirect('profile');
	}    

}