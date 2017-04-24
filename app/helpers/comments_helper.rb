module CommentsHelper
  def comments_tree_for(comments)
    comments.map do |comment, nested_comments|
      nested = (
        nested_comments.size > 0 ?
          content_tag(:div, comments_tree_for(nested_comments), class: 'replies') :
          nil
      )
      render(comment) << nested
    end.join.html_safe
  end
end
