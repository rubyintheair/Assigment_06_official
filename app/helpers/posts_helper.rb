module PostsHelper
  def mentions_text(post)
    answer = ""
    if post.mentions.any?
      answer << "with #{post.mentions.first.user.name}"
      if post.mentions.count > 1
        num = " and #{pluralize(post.mentions.count - 1, "other")}"
        answer << num
      end 
      answer 
    end 
  end 
end
