popoverOptions = undefined
popoverOptions =
  placement: 'bottom'
  trigger: 'click'
  html: true
  content: ->
    $(this).next().html()

$ ->
  
  #禁止ie6图片闪烁
  try
    document.execCommand 'BackgroundImageCache', false, true
  
  #给ie9以下浏览器的input加上placeholder
  input = document.createElement('input')
  if 'placeholder' of input is false
    $('[placeholder]').each ->
      ph = $(this).attr('placeholder')
      $(this).focus(->
        $(this).val('').removeClass 'placeholder'  if $(this).val() is ph
      ).blur(->
        $(this).val(ph).addClass 'placeholder'  if $(this).val() is ''
      ).trigger 'blur'

  
  # panel toggle
  # g-user-账号设置.html 板块收起/展开
  $(document).on 'click', '.panel-toggle', (e) ->
    e and e.preventDefault()
    $this = $(e.target)
    $class = 'collapse'
    $target = undefined
    $this = $this.closest('a')  unless $this.is('a')
    $target = $this.closest('.panel')
    $target.find('.panel-body').toggleClass $class
    $this.toggleClass 'active'
    return

  
  # 字数限制
  $('.status-body').charCount()

  $('.select2').select2()

  $('input[data-role=tagsinput], select[multiple][data-role=tagsinput]').tagsinput
    confirmOnBlur: true

  
  # Popover支持
  $('a[rel=popover]').popover popoverOptions

  $(document).on 'click', '.btn-close-popover', (e) ->
    $('a[rel=popover]').popover 'toggle'

  $('input.btn-radio, input.boolean').iCheck
    checkboxClass: 'icheckbox_minimal'
    radioClass: 'iradio_minimal'
    increaseArea: '20%' #optiona;