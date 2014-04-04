$ ->
  $(document).on 'click', '.btn-sms', (e) ->

    if $(e.target).hasClass('disabled')
      $("#user_captcha_confirmation").focus()
      return
    else
      $(e.target).removeClass('btn-sms')
    if true # $('#user_mobile_phone').valid()
      mobilePhone = $(this).parents('form').find('#user_mobile_phone').val()
      $.ajax
        type: 'POST'
        url: '/signup/send_sms'
        data: { mobile_phone: mobilePhone }
        success: (data) ->
          $wrapper = $("div.user_mobile_phone")

          if data.success
            console.log 'success'

            html = "验证码已发送 <span id='sms_counter'></span> 后可再次发送"
            if $wrapper.find('.help-inline').size() > 0
              $wrapper.find('.help-inline')[0].remove()

            $(e.target).html(html)

            $mobilePhoneWrapper = $("div.user_mobile_phone")
            if $mobilePhoneWrapper.find('.help-inline').size() > 0
              $($mobilePhoneWrapper.find('.help-inline')[0]).html('')
            $(e.target).addClass('disabled')
            startSmsCounter()
            $("#user_captcha_confirmation").focus()
            $("input#user_mobile_phone").attr('readonly', 'readonly')
          else
            if data.error == "mobile_phone_incorrect"
              html = "手机号码是无效的"
              $mobilePhoneWrapper = $("div.user_mobile_phone .controls")
              if $mobilePhoneWrapper.find('.help-inline').size() > 0
                $($mobilePhoneWrapper.find('.help-inline')[0]).html(html)
              else
                $mobilePhoneWrapper.append("<span class='help-inline'>#{html}</span>")
              $("input#user_mobile_phone").removeAttr('readonly')
            else
              html = data.msg
              if $wrapper.find('.help-inline').size() > 0
                $($wrapper.find('.help-inline')[0]).html(html)
              else
                $wrapper.append("<span class='help-inline'>#{html}</span>")
              $("input#user_mobile_phone").removeAttr('readonly')

        error: ->
          html = "验证码未成功发送，请再次点击发送验证码"
          if $wrapper.find('.error').size() > 0
            $($wrapper.find('.error')[0]).html(html)
          else
            $wrapper.append("<span class='error'>#{html}</span>")

  smsCounterInterval = null
  smsCounterStartAt = null
  smsCounterLength = 120

  startSmsCounter = ->
    smsCounterStartAt = new Date().getTime()
    updateSmsCounter()
    smsCounterInterval = setInterval(updateSmsCounter, 100)

  updateSmsCounter = ->
    timeNow = new Date().getTime()
    timeLeft = parseInt(((smsCounterLength*1000) - (timeNow - smsCounterStartAt))/1000)
    if timeLeft > 0
      minutesLeft = parseInt(timeLeft / 60)
      secondsLeft = timeLeft - (minutesLeft*60)
      if (secondsLeft>9)
        $("#sms_counter").html(minutesLeft+":"+secondsLeft)
      else
        $("#sms_counter").html(minutesLeft+":0"+secondsLeft)
    else
      window.clearInterval(smsCounterInterval)
      smsCounterInterval = null
      $("#sms_counter").parent('a.btn-sms').html('请再次点击发送验证码')
      $("a.btn-sms").removeClass('disabled')
      $("input#user_mobile_phone").removeAttr('disabled')

  smsValidationFilled = ->
    if smsCounterInterval == null
      return false
    if $("input#user_captcha_confirmation").val().length >= 6
      return true
