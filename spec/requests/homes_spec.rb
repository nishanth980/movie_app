require 'rails_helper'

RSpec.describe "Homes", type: :request do
  before(:each) do
    sign_in FactoryBot.create(:user, role_id: Role.create!(name: "admin").id)
  end

  describe "GET /home" do
    it "redirects user based on the role" do
      get '/home'
      expect(response).to redirect_to(admin_home_index_path)
    end

    it 'will test the flow for user with role as customer' do
      user = User.first
      user.update!(role: Role.create!(name: "customer"))
      sign_in user
      get '/home'
      expect(response).to render_template("home/index")
    end
  end
end
