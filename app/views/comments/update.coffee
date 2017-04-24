$('#comment-<%= @comment_source.id %>').replaceWith(
  '<%= j comments_tree_for @comment_hash %>'
)