class PostMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.post_mailer.notify_new_post.subject
  #
  def notify_new_post(post)
    @post = post
    mail to: "#{@post.poster.name}", subject: "#{@post.poster.name} wrote on your wall"
  end
end
