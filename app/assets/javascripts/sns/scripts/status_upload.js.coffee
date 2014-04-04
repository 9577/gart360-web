class @StatusImageUploader
  constructor: (opts) ->
    uploader = new plupload.Uploader
      runtimes        : 'html5, flash'
      browse_button   : opts.button
      max_file_size   : '10mb'
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
      $(
        ("<li class=\"photo uploading\" id=\"#{file.id}\">
            <div class=\"g-block\"><b>0%</b></div>
          </li>" for file in files).join('')
      ).appendTo('#status_images')

      uploader.start()

    uploader.bind "BeforeUpload", (up, file) ->
      uploader.settings.multipart_params =
        file_id: file.id
        target: opts.button
        page: $("##{opts.button}").parents('.upload').data('target')
        authenticity_token: $('meta[name="csrf-token"]').attr('content')

    uploader.bind 'Error', (up, err) ->
      up.refresh()

    uploader.bind 'UploadProgress', (up, file) ->
      text = \
        if parseInt(file.percent) == 100
          '100%'
        else
          file.percent + '%'
      $("##{file.id} .g-block b").html(text)

    uploader.bind 'FileUploaded', (up, file, data) ->
      eval(data.response)
