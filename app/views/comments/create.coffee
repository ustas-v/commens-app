$('#main-comments-form').replaceWith '<%= j render 'comments/form' %>'

<% if @comment.parent.nil? %>
$('#comments-container').prepend '<%= j comments_tree_for @comment_hash %>'
<% else %>
$('#comment-<%= @comment.parent_id %>').replaceWith(
  '<%= j comments_tree_for @comment_hash %>'
)
<% end %>