class FeedbackMailer < ApplicationMailer
  def admin_email(feedback)
    body = feedback.body
    mail(to: feedback.email, subject: "New feedback from #{feedback.name}") do |format|
      format.text { render plain: body }
      format.html { render html: "<p>#{body}</p>".safe_join }
    end
  end
end
