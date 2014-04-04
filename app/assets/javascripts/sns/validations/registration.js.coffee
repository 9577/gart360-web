class @RegistrationValidator
  constructor: ->
    @new_registration()

  new_registration: ->
    $('.signup-form').validate
      rules:
        'user[email]':                    { required: true, remote: '/valid/email' }
        'user[username]':                 { required: true, minlength: 2, maxlength: 10, remote: '/valid/username' }
        'user[password]':                 { required: true, minlength: 6 }
        'user[password_confirmation]':    { required: true, equalTo: '#user_password' }