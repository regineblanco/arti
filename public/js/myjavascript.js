$('.like').on('click', function(event){
	event.preventDefault();
	postId = event.target.parentNode.dataset['postid'];
	var isLike = event.target.previousElementSibling == null;
   // console.log(postId);
   $.ajax({
   		method: 'POST',
   		url: urlLike,
   		data: {isLike: isLike, postId: postId, _token: token}
   })
   	.done(function() {
   		event.target.innerText = isLike ? event.target.innerText == 'yas' ? 'liked!' : 'yas' : event.target.innerText == 'disliked!' ? 'nah' : 'disliked!';
   		if (isLike) {
   			event.target.nextElementSibling.innerText = 'nah';
   		} else {
   			event.target.previousElementSibling.innerText = 'yas';
   		}
   	}); 

   	// .done(function() {
   	// 	event.target.innerText = isLike ? event.target.style.color == 'red' ? 'black' : 'red' : event.target.style.color == 'blue' ? 'black' : 'blue';
   	// 	if (isLike) {
   	// 		event.target.nextElementSibling.style.color = 'black';
   	// 	} else {
   	// 		event.target.previousElementSibling.style.color = 'black';
   	// 	}
   	// }); 
   	
});