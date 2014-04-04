<%- if resource.errors.empty? %>
$('.comment-list').prepend "<%=j render('sns/comments/comment', comment: resource) %>"
$('#comment_body').val ''
<%- end %>