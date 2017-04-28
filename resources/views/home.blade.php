@extends('layouts.app') 

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-6 col-md-offset-3">

            <!-- LOG IN ALERT-->
            @if(Session::has('message')) 
            <div class="panel panel-danger">
                <div class="panel-heading text-center">
                    {{Session::get('message')}}
                </div>
            </div>
            @endif 
           
            <!-- CREATE POST -->
            <div class="panel panel-default">
                <div class="panel-body">
                    <form action="{{ url('createpost') }}" method="POST">
                    {{csrf_field()}}
                        <div class="form-group">
                            <textarea name="body" class="form-control" rows="3" placeholder="your random thoughts go here"></textarea>
                        </div>
                        <button type="submit" class="btn btn-default">create post</button>    
                        <button type="button" data-toggle="modal" data-target="#addphoto" class="btn btn-default" class="photo-button">photo</button>
                    </form> 
                    <form action='{{ url("addphoto") }}' method="POST" enctype="multipart/form-data">

                        <!-- modal to ADD PHOTO -->
                        <div id="addphoto" class="modal fade" role="dialog">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h5 class="modal-title">add a photo</h5>
                                    </div>
                                    <!-- form add photo -->                                 
                                    {{csrf_field()}}
                                        <div class='modal-body'>     
                                            <input type="file" name="photo" class="form-control"><br>
                                            <input type="text" name="caption" class="form-control" placeholder="what can you say about this photo?">
                                        </div>
                                        <div class="modal-footer">            
                                            <button type="submit" class="btn btn-default">save</button>
                                            <button type="button" class="btn btn-default" data-dismiss="modal">close</button>
                                        </div>
                                </div> <!-- close modal-content -->
                            </div> <!-- close modal-dialogue -->
                        </div> <!-- close modal fade -->
                        <!-- close edit post modal -->
                     </form>
                     
                </div> 
            </div>

            <!-- DASHBOARD -->
            @foreach($posts as $post) 
            <div class="panel panel-default">
                <div class="panel-heading">
                    <a class="username" href="{{ url('profile/'.$post->user->id) }}">{{ $post->user->name }}</a>
                    <span class="pull-right"> {{ $post->created_at->format('mdy | G:i') }} </span>
                </div>
                <div class="panel-body post">

                    @if(null !== $post->photo)
                        <img class="img-responsive" src="{{ asset('img/'.$post->photo->photo) }}"><div class="photo-caption"><p>{{ $post->photo->caption }}</p></div>                    
                    @else 
                       <p class="text-justify">{{ $post->body }}</p>
                    @endif

                   <div class="interaction">
                           
                       @if($post->user_id == Auth::user()->id)    
                           <!-- delete button -->
                           <a class="glyphicon glyphicon-trash pull-right" href='{{ url("home/$post->id/delete") }}' data-toggle="tooltip" title="delete post"></a>       
                           <!-- edit button -->
                           <span class="glyphicon glyphicon-edit pull-right" data-toggle="modal" data-toggle="tooltip" title="edit post" data-target="#edit{{$post->id}}"></span>
      
                           <!-- <a href='{{ url("home/$post->id/edit") }}'>edit</a> -->
                           <!-- modal to EDIT POST -->
                           <div id="edit{{$post->id}}" class="modal fade" role="dialog">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h5 class="modal-title">edit post</h5>
                                        </div>
                                        <!-- form edit post -->
                                       <form action='{{ url("editpost/$post->id") }}' method="POST">
                                        {{csrf_field()}}
                                            <div class='modal-body'>     
                                                <textarea name="body" class="form-control" rows="3">{{ $post->body }}</textarea>
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
                       @endif
                       <span data-postid='{{ $post->id }}' class="yas">
                           <span class="like">{{ Auth::user()->likes()->where('post_id', $post->id)->first() ? Auth::user()->likes()->where('post_id', $post->id)->first()->like == 1 ? 'liked!' : 'yas' : 'yas' }}</span>
                           <span class="like">{{ Auth::user()->likes()->where('post_id', $post->id)->first() ? Auth::user()->likes()->where('post_id', $post->id)->first()->like == 0 ? 'disliked!' : 'nah' : 'nah' }}</span>
                           <span class="glyphicon glyphicon-plus" data-toggle="modal" data-target="#addcomment{{$post->id}}" data-toggle="tooltip" title="add a comment"></span>
                       </span>

                           <!-- modal to ADD COMMENT -->
                           <div id="addcomment{{$post->id}}" class="modal fade" role="dialog">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h5 class="modal-title">add a comment</h5>
                                        </div>
                                        <!-- form add comment -->
                                       <form action='{{ url("addcomment/$post->id") }}' method="POST">
                                        {{csrf_field()}}
                                            <div class='modal-body'>     
                                                <textarea name="body" class="form-control" rows="3"></textarea>
                                            </div>
                                            <div class="modal-footer">            
                                                <button type="submit" class="btn btn-default">save</button>
                                                <button type="button" class="btn btn-default" data-dismiss="modal">close</button>
                                            </div>
                                        </form>
                                    </div> <!-- close modal-content -->
                                </div> <!-- close modal-dialogue -->
                            </div> <!-- close modal fade -->
                            <!-- close add a comment modal -->
                       
                       <!-- VIEW COMMENTS -->
                       <span class="glyphicon glyphicon-eye-open" data-toggle="collapse" data-target="#comments{{$post->id}}" data-toggle="tooltip" title="see comments"></span>
                           <div id="comments{{$post->id}}" class="collapse">

                                @foreach($post->comments as $comment)
                                    <a class="username" href="{{ url('profile') }}">{{ $comment->user->name }}</a>
                                    {{ $comment->body }}

                                   @if($comment->user_id == Auth::user()->id) 
                                       <a class="glyphicon glyphicon-trash pull-right" href='{{ url("home/$comment->id/deletecomment") }}'  data-toggle="tooltip" title="delete comment"></a>      
                                       <span class="glyphicon glyphicon-edit pull-right" data-toggle="modal" data-target="#edit{{$comment->id}}" data-toggle="tooltip" title="edit comment"></span>
                                       <br>

                                       <!-- modal to edit comment -->
                                       <div id="edit{{$comment->id}}" class="modal fade" role="dialog">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                        <h5 class="modal-title">edit your comment</h5>
                                                    </div>
                                                    <!-- form edit post -->
                                                    <form action='{{ url("editcomment/$comment->id") }}' method="POST">
                                                    {{csrf_field()}}
                                                        <div class='modal-body'>     
                                                            <textarea name="body" class="form-control" rows="3">{{ $comment->body }}</textarea>
                                                        </div>
                                                        <div class="modal-footer">            
                                                            <button type="submit" class="btn btn-default">save</button>
                                                            <button type="button" class="btn btn-default" data-dismiss="modal">close</button>
                                                        </div>
                                                    </form>
                                                </div> <!-- close modal-content -->
                                            </div> <!-- close modal-dialogue -->
                                        </div> <!-- close modal fade -->
                                        <!-- close edit comment modal -->
                                    @else <br>
                                    @endif
                                @endforeach

                           </div> <!-- close comments collapse -->
                   </div> <!-- close interaction -->
                </div> <!-- close panel-body post -->
            </div> <!-- close panel-default -->
            @endforeach

        </div> <!-- close col-md -->
    </div> <!-- close row -->
</div> <!-- close container -->
@endsection

<script>
    var token = '{{ Session::token() }}';
    var urlLike = '{{ url('like') }}';
</script>

