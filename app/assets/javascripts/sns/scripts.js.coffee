root = this

$ ->
  $(document)
    .on 'ajax:success', '.btn-favourite', (xhr, data, status) ->
      $(this).find('span.num').text data.fans_count
      $(this).attr 'href', data.url

      if $(this).hasClass 'btn-active'
        $(this).removeClass 'btn-active'
      else
        $(this).addClass 'btn-active'

    .on 'ajax:success', '.btn-follow', (xhr, data, status) ->
      $(this).attr 'href', data.url

      if $(this).hasClass 'btn-active'
        $(this).removeClass 'btn-active'
        $(this).text '关注'
      else
        $(this).addClass 'btn-active'
        $(this).text '已关注'
