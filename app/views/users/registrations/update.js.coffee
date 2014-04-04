<%- if resource.errors.empty? %>
  <%- if params[:type] == 'basic' %>

  $container = $('#basic')
  $container.find('span.input').text '<%= resource.username %>'
  # $container.find('.form-actions .controls').append '<div class="alert fl"><em class="icon icon-ok"></em>设置成功</div>'
  <%- elsif params[:type] == 'avatar' %>

  $container = $('#avatar')
  console.log $container.find('a.userpic img')
  $container.find('a.userpic img').attr 'src', '<%= resource.avatar %>'

  <%- end %>
<%- end %>