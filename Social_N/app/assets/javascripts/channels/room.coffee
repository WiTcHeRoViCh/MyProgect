$ ->
  if $('#messages').length > 0
    initCableChannel($('#messages'))

$(document).on 'click', '.room-channel', ->
  initCableChannel($(@))

$(document).on 'keypress', '#message_body', (event) ->
  if event.keyCode is 13
    message_form = $(@).parents('form')
    current_user_id = $('#message_user_id').val()

    if message_form.hasClass('new_message')
      App.room.speak event.target.value, current_user_id
      event.target.value = ''
      event.preventDefault()
    else
      message_form.submit()

$(document).on 'click', '.destroy_message', ->
  App.room.destroy $(@).parents('.message').data('message-id')

initCableChannel = (roomElement) ->
  App.room = App.cable.subscriptions.create {
    channel: "RoomChannel", roomId: roomElement.data('room-id') },

    received: (data) ->
      appendMessage(data)
      destroyMessage(data)
      updateMessage(data)

    speak: (body, current_user_id) ->
      @perform 'speak', body: body, current_user_id: current_user_id

    destroy: (id) ->
      @perform 'destroy', id: id

appendMessage = (data) ->
  if data['action'] == 'create'
    $('#messages').append data['message']

destroyMessage = (data) ->
  if data['action'] == 'destroy'
    message = $("*[data-message-id=#{data['id']}]")
    message.remove();

updateMessage = (data) ->
  if data['action'] == 'update'
    message = $("*[data-message-id=#{data['id']}]")
    message.html(data['message'])
