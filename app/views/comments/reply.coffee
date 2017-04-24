$('#comment-<%= @reply_comment.parent_id %>').append(
  '<%= j render 'comments/form' %>'
)