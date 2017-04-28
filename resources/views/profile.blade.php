@extends('layouts.app')

@section('content')

	<!-- PROFILE -->
	<div class="panel panel-default profile-details">
	    <div class="panel-body text-center">
	    	<div class="row">
	    		<div class="col-xs-3">
	    			@if(null !== $profile->image)
	    				<img class="hidden-xs img-responsive dp" alt="profile photo" src="{{ asset('img/'.$profile->image) }}">
	    			@else
	    				<img class="hidden-xs img-responsive dp" alt="profile photo" src="{{ $default_image }}">
	        		@endif
	        	</div>
	        	<div class="col-xs-9">
	        		<div class="display-name text-left">
	        			<h3 id="big-username">{{ $profile->name }}</h3>
	        			
	        			@if($profile->id == Auth::user()->id)
	        				<span class="glyphicon glyphicon-edit" data-toggle="modal" data-toggle="tooltip" title="edit profile" data-target="#editprofile"></span>
        				@endif
	        			<p class="bio">{{ $profile->bio }}</p>
	        		</div>
	        		<div class="row">
	        			<!-- <div class="col-xs-6">1,000 following</div>
	        			<div class="col-xs-6">1,000 followers</div> -->
	        		</div> <!-- close row follows -->
	        	</div> <!-- close right column -->
	        </div> <!-- close row profile details -->
	    </div> <!-- close panel-body -->
	</div> <!-- close panel-default -->

	<!-- EDIT PROFILE MODAL -->  
   <div id="editprofile" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h5 class="modal-title">edit profile</h5>
                </div>
                <!-- form edit profile -->
               <form action='{{ url("editprofile") }}' method="POST" enctype="multipart/form-data">
                {{csrf_field()}}
                    <div class='modal-body'>
                    	<input type="file" name="image" class="form-control"><br> 
                        <textarea name="bio" class="form-control" rows="3">{{ Auth::user()->bio }}</textarea>
                    </div>
                    <div class="modal-footer">            
                        <button type="submit" class="btn btn-default">save</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">close</button>
                    </div>
                </form>
            </div> <!-- close modal-content -->
        </div> <!-- close modal-dialogue -->
    </div> <!-- close modal fade -->
    <!-- close edit post modal -->

	<!-- GRID -->
	<div class="container" id="grid" data-columns>
		@foreach($posts as $post) 	
			@if(null !== $post->photo)
	            <div class="profile-post"><img class="img-responsive" src="{{ asset('img/'.$post->photo->photo) }}"><p>{{ $post->photo->caption }}</p></div>                    
	        @else 
	           <div class="profile-post"><p class="text-justify">{{ $post->body }}</p></div>
	     	@endif	   
		@endforeach	
	</div>	
@endsection




