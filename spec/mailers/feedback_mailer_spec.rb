require "rails_helper"

describe FeedbackMailer do
  let(:attrs) { { name: "John", email: "john@doe.com", body: "Hey!" } }
  let(:feedback) { Feedback.new(attrs) }
  let!(:email) { described_class.admin_email(feedback) }

  it "sets to be delivered to the email passed in" do
    expect(email).to deliver_to(feedback.email)
  end

  it "contains the user's message in the mail body" do
    expect(email).to have_body_text(feedback.body)
  end

  it "has the correct subject" do
    expect(email).to have_subject("New feedback from #{feedback.name}")
  end
end
