$ ->
  $.validator.setDefaults
    highlight: (element) -> false
    unhighlight: (element) -> false
    errorElement: 'span'
    errorClass: 'error-block'
    validClass: 'valid-block'
    errorPlacement: (error, element) ->
      element.parent().find('.valid-block').remove()

      error.insertAfter(element)
    success: (label, element) ->
      parent = label.parent()
      $(label).remove()
      if !$(parent).hasClass('ignore-success-info')
        parent.append('<span class=\"valid-block\"></span>').show()
    onkeyup: false
    onfocusout: (element, event) -> $(element).valid()
    ignore: '.ignore'

  new GroupValidator
  new TopicValidator
  new EventValidator
  new GalleryValidator
  new SessionValidator
  new RegistrationValidator
  new ConversationValidator
  new ArtworkValidator