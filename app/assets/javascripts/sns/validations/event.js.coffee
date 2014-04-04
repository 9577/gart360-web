class @EventValidator
  constructor: ->
    @new_event()

  new_event: ->
    $('.event-form').validate
      rules:
        'event[subject]':     { required: true }
        'event[description]': { required: true }
        'event[start_at]':    { required: true }
        'event[end_at]':      { required: true }