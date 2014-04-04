class @GroupValidator
  constructor: ->
    @new_group()

  new_group: ->
    $('.group-form').validate
      rules:
        'group[name]':                    { required: true }
        'group[description]':             { required: true }
        'group[tag_list]':                { required: true }
      errorPlacement: (error, element) ->
        if element.attr("name") is "group[tag_list]"
          element.siblings('.bootstrap-tagsinput').after(error)
        else
          error.insertAfter(element)
