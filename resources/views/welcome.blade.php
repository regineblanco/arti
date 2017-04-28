@extends('layouts.app')

@section('title')
    arti
@endsection

@section('content')
	<div class="welcome-page well">
	    <h3>a<strong>rt</strong>i</h3>
	    <p>a microblogging web app where you can share your random thoughts and musings, photos that you want the world to see.</p>
	    <p>arti is a spelled-out acronym of "rt"-- random thoughts. it also has double meaning only people who speak tagalog will know.</p>
	    <p>created by aspiring web developer regine blanco.</p><br>
	    <div class="button-guest">
		    <a href="{{ route('register') }}"><button class="btn btn-default">sign up</button></a>
		    <a href="{{ route('login') }}"><button class="btn btn-default">log in</button></a>
		    <!-- <button class="btn btn-default">lurk around</button> -->
		</div>
	</div>
@endsection  