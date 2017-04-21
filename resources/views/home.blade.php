@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-6 col-md-offset-3">

            <!-- log in alert -->
            @if(Session::has('message'))
            <div class="panel panel-default">
                <div class="panel-body text-center">
                    {{Session::get('message')}}
                </div>
            </div>
            @endif
           
            <!-- create post -->
            <div class="panel panel-default">
                <div class="panel-body">
                    <form action="{{url('createpost')}}" method="POST">
                    {{csrf_field()}}
                        <div class="form-group">
                            <textarea name="body" class="form-control" rows="3" placeholder="your random thoughts go here"></textarea>
                        </div>
                        <button type="submit" class="btn btn-default">create post</button>
                        <button type="submit" class="btn btn-default">photo</button>
                    </form>   
                </div> 
            </div>

            <!-- dashboard -->
            @foreach($posts as $post) 
            <div class="panel panel-default">
                <div class="panel-heading">
                    <strong>{{ $post->user->name }}</strong> | {{ $post->created_at }}
                </div>
                <div class="panel-body post">
                   <p>{{ $post->body }}</p>
                   <div class="interaction">
                        <a href="">yes</a>
                       <a href="">nah</a>
                       <a href="">edit</a>
                       <a href='{{ url("home/$post->id/delete") }}'>delete</a>
                   </div>
                </div>
            </div>
            @endforeach

        </div> <!-- close col-md -->
    </div> <!-- close row -->
</div> <!-- close container -->
@endsection
