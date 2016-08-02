class FeedbackMailer < ApplicationMailer
  def admin_email(feedback)
    body = feedback.body
    mail(to: feedback.email, subject: "New feedback from #{feedback.name}") do |format|
      format.text { render plain: body }
      format.html { render html: content_tag(:p, body) }
    end
  end
end
