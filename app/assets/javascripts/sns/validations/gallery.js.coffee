class @GalleryValidator
  constructor: ->
    @new_gallery()

  new_gallery: ->
    $('.gallery-form').validate
      rules:
        'gallery[name]':     { required: true }
        'gallery[content]':  { required: true }
        'gallery[tag_list]': { required: true }
      errorPlacement: (error, element) ->
        if element.attr("name") is "gallery[tag_list]"
          element.siblings('.bootstrap-tagsinput').after(error)
        else
          error.insertAfter(element)
