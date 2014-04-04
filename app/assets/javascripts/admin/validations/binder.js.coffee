$ ->
  $.validator.setDefaults
    highlight: (element) -> false
    unhighlight: (element) -> false
    errorElement: 'span'
    errorClass: 'error-block'
    validClass: 'valid-block'
    errorPlacement: (error, element) ->
      element.parent().find('.valid-block').remove()
      if element.parent('.input-group').length
        error.insertAfter(element.parent())
      else if element.parent('.redactor_box').length > 0
        element.parents('.col-sm-10').append(error)
      else
        error.insertAfter(element)
    success: (label, element) ->
      parent = label.parent()
      $(label).remove()
      if !$(parent).hasClass('ignore-success-info')
        parent.append('<span class=\"valid-block\"></span>').show()
    onkeyup: false
    onfocusout: (element, event) -> $(element).valid()
    ignore: '.ignore'


  new ProductValidator