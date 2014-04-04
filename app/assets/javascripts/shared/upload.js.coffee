class @MainUploader
  constructor: (opts) ->
    uploader = new plupload.Uploader
      runtimes        : 'html5, flash'
      browse_button   : opts.button
      max_file_size   : '5mb'
      url             : opts.url
      flash_swf_url   : '/uploader.swf'
      filters         : [
          {title : "图片文件", extensions : "jpg,gif,png"}
      ]
      file_data_name  : 'image'
      multipart       : true
      multipart_params:
        authenticity_token: $('meta[name="csrf-token"]').attr('content')

    uploader.init()

    uploader.bind 'FilesAdded', (up, files) ->
      parent = $("##{opts.button}").parents('.upload')
      $('.img-holder img', parent).hide()
      $('.img-holder', parent).html("<div class=\"uploading\"><span class=\"g-block\"><b>0%</b></span></div>")

      uploader.start()

    uploader.bind "BeforeUpload", (up, file) ->
      uploader.settings.multipart_params =
        target: opts.button
        page: $("##{opts.button}").parents('.upload').data('target')
        authenticity_token: $('meta[name="csrf-token"]').attr('content')

    uploader.bind 'Error', (up, err) ->
      up.refresh()

    uploader.bind 'UploadProgress', (up, file) ->
      text = \
        if parseInt(file.percent) == 100
          '上传完毕,处理中...'
        else
          file.percent + '%'
      $("##{opts.button}").parents('.upload').find('p.g-block b').html(text)

    uploader.bind 'FileUploaded', (up, file, data) ->
      eval(data.response)
      $("##{opts.button}").parents('.upload').find('p.g-block b').html('')
