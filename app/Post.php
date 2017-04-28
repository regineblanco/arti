<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    public function user()
    {
    	return $this->belongsTo('App\User');
    }

    public function comments()
    {
    	return $this->hasMany('App\Comment');
    }

    public function photo()
    {
    	return $this->hasOne('App\Photo');
    }

    public function likes()
    {
        return $this->hasMany('App\Like');
    }
} 
