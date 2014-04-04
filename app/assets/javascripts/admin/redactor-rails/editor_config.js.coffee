class @RedactorInitializer
  csrf_token: -> $("meta[name=csrf-token]").attr("content")
  csrf_param: -> $("meta[name=csrf-param]").attr("content")

  form_params: ->
    params = ''
    if @csrf_param() isnt `undefined` and @csrf_token() isnt `undefined`
      params += @csrf_param() + "=" + encodeURIComponent(@csrf_token())

    if $('#pic-ver').length > 0
      params += '&ver=' + $('#pic-ver').val()

    params

  init_with_area: (area) ->
    @element = $('.reditor', area)
    @element_without_upload = $('.reditor-without-upload', area)
    @element_for_reply = $('.reditor-for-reply', area)

    @start_binding()

  init_by_default: ->
    @element = $('.reditor')
    @element_without_upload = $('.reditor-without-upload')
    @element_for_reply = $('.reditor-for-reply')

    @start_binding()

  start_binding: ->
    @default_redactor(@element) if $(@element).length > 0
    @redactor_without_upload(@element_without_upload) if $(@element_without_upload).length > 0
    @redactor_for_reply(@element_for_reply) if $(@element_for_reply).length > 0

  default_redactor: (element) ->
    element.redactor
      toolbarFixed: true
      toolbarFixedTopOffset: 92
      toolbarFixedBox: true
      imageUpload: "/redactor/pictures?" + @form_params()
      imageGetJson: "/redactor/pictures"
      fileUpload: "/redactor_rails/documents?" + @form_params()
      fileGetJson: "/redactor_rails/documents"
      path: "/assets/redactor-rails"
      lang: "zh_cn"
      css: "style.css"
      minHeight: 200
      placeholder: '请输入正文...'
      plugins: ['fullscreen']

  redactor_without_upload: (element) ->
    element.redactor
      imageUpload: "/redactor/pictures?" + @form_params()
      imageGetJson: "/redactor/pictures"
      fileUpload: "/redactor_rails/documents?" + @form_params()
      fileGetJson: "/redactor_rails/documents"
      path: "/assets/redactor-rails"
      lang: "zh_cn"
      css: "style.css"
      buttons: ["bold", "italic", "deleted", "unorderedlist", "orderedlist", "outdent", "indent", "alignment", "horizontalrule"]
      dragUpload: false
      minHeight: 200
      placeholder: '请输入正文...'
      plugins: ['fullscreen']

  redactor_for_reply: (element) ->
    element.redactor
      imageUpload: "/redactor/pictures?" + @form_params()
      imageGetJson: "/redactor/pictures"
      fileUpload: "/redactor_rails/documents?" + @form_params()
      fileGetJson: "/redactor_rails/documents"
      path: "/assets/redactor-rails"
      lang: "zh_cn"
      css: "style.css"
      buttons: ["bold", "italic", "deleted", "unorderedlist", "orderedlist", 'image']
      minHeight: 95
      placeholder: '请输入评论...'
