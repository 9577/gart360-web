class @SessionValidator
  constructor: ->
    @new_session()

  new_session: ->
    $('.signin-form').validate
      rules:
        'user[email]':                    { required: true}
        'user[password]':                 { required: true }