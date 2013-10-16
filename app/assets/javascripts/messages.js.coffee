# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#definining dispatcher as the variable that is creating a new websocket channel 
dispatcher = new WebSocketRails 'localhost:3000/websocket'

channel = dispatcher.subscribe 'messages' #where messages is the channel subscribed to
channel.bind 'yo', (message) -> #where 'yo' is the event we are listening to with the contents 'message'
	append_message(message.name, message.message, message.id)

append_message = (name, message, id)->
	#alert("you can use alert to see if things are working")
	#'#message_feed' is a jQuery reference. text: refers to a hash of information that you want to return to the screen
	#name and message are params that you are returning. you add +' : '+ for any text in between
	# $('body').append($('<p>',{text: $('<a>', {href: '/messages/' + id, text: name+': '+message}) }))
	$('#message_feed').append('<p>'+name+' <a href="/messages/' + id+'">'+message+'</a></p>')

	#the below code on line 20 replaces code on line 17 but does not allow for concurrent use.
	#window.location.reload()

#read up on handlebars before finishing code below
#template = Handlebars.compile($("#message_feed").html())


