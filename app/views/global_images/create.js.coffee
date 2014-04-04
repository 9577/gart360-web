<%- if params[:file_id].present? %>
  $('#<%= params[:file_id] %>').replaceWith("<%=j render('global_images/image', image: @image) %>")
<%- else %>
  parent = $("#<%= params[:target] %>").parents('.upload')
  $('.img-holder', parent).html("<%=j image_tag(@image.data.url(@image.target_type.to_sym)) %>")
  $('.target_input', parent).val("<%= @image.data.url %>")
<%- end %>