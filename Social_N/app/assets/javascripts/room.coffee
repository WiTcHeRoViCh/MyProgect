App.room = App.cable.subscriptions.create "RoomChannel",

  received: (data) ->
    if data['action'] == 'create'
      $('#messages').append data['message']
    
  speak: (message) ->
    @perform 'speak', message: message


$(document).on 'keypress', '#message_body', (event) ->
  if event.keyCode is 13
      App.room.speak event.target.value
      event.target.value = ''
      event.preventDefault()
