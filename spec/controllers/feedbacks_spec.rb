require "rails_helper"

RSpec.describe FeedbacksController, type: :controller do
  describe "GET new" do
    it "renders 'new' template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "POST create" do
    let(:params) do
      {
        feedback: {
          name: name,
          email: "email@example.com",
          body: "Hallo"
        }
      }
    end

    before { post :create, params: params }

    context "when params valid" do
      let(:name) { "Name" }

      it "Sends feedback email" do
        expect(response).to redirect_to(root_url)
        expect(flash[:notice]).to eq("Mail sent successfuly.")
      end
    end

    context "when required params missing" do
      let(:name) { nil }

      it "Does not send feedback email" do
        expect(response).to render_template("new")
      end
    end
  end
end
