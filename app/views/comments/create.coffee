$('#main-comments-form').replaceWith '<%= j render 'comments/form', main_form: true %>'

<% if @comment_source.parent.nil? %>
$('#comments-container').prepend '<%= j comments_tree_for @comment_hash %>'
<% else %>
$('#comment-<%= @comment_source.parent_id %>').replaceWith(
  '<%= j comments_tree_for @comment_hash %>'
)
<% end %>