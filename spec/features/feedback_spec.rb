require "rails_helper"

feature "Sending Feedback" do
  before { visit root_path }

  context "form valid" do
    scenario "Visitor sends feedback" do
      fill_in "feedback_name", with: "John Doe"
      fill_in "feedback_email", with: "John@Doe.com"
      fill_in "feedback_body", with: "Hey!!!"
      click_on "Save Feedback"

      expect(page).to have_text("Mail sent successfuly.")
    end
  end

  context "form not valid" do
    scenario "Visitor sends feedback" do
      click_on "Save Feedback"

      expect(page).not_to have_text("Mail sent successfuly.")
      expect(page).to have_text("Name can't be blank")
      expect(page).to have_text("Email can't be blank")
      expect(page).to have_text("Body can't be blank")
    end
  end
end
