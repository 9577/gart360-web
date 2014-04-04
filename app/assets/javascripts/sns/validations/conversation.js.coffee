class @ConversationValidator
  constructor: ->
    @new_conversation()

  new_conversation: ->
    $('.converastion-form').validate
      rules:
        'conversation[messages_attributes][body]': { required: true }