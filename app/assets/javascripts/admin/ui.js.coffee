$.fn.editable.defaults.mode = 'inline'

$ ->
  $('[data-toggle=tooltip], [rel=tooltip]').tooltip()

  $('.editable').editable()

  # $('.editable').on 'shown', (e) ->
  #   console.log 'xxx'
  #   $('.popover-content').find('select').select2
  #     width: 200
  #   $('.select2-container').removeClass('form-control').removeClass('.input-sm')

  # $('.sortable').sortable
  #   stop: ->
  #     $.ajax
  #       type: 'POST'
  #       url: $(@).data('update-url')
  #       data: $(@).sortable('serialize')

  $('.sortable').sortable().on 'sortupdate', (e) ->
    console.log $(this).find('li')
    
    dataIDList = $(this).find('li').map(->
      $(this).data 'id'
    ).get().join(',')

    $.ajax
      type: 'POST'
      url: $(@).data('update-url')
      data: { p: dataIDList }