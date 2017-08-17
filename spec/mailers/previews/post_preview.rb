# Preview all emails at http://localhost:3000/rails/mailers/post
class PostPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/post/notify_new_post
  def notify_new_post
    PostMailer.notify_new_post
  end

end
