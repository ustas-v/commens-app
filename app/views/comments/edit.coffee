$('#comment-<%= @comment_source.id %>').find('.panel-body').remove()
$('#comment-<%= @comment_source.id %>').find('.panel-footer').before(
  '<%= j render 'comments/form' %>'
)