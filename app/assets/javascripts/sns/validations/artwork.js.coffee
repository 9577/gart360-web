class @ArtworkValidator
  constructor: ->
    @new_artwork()

  new_artwork: ->
    $('.artwork-form').validate
      rules:
        'artwork[name]':     { required: true }
        'artwork[content]':  { required: true }
