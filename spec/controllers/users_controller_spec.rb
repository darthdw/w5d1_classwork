require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do

    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the :new page" do
      get :new
      expect(response).to render_template('new')
    end

  end

  describe "GET #create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
    it "redirects to the :new page on failure" do
      post :create, params: { user: {username: "buggle", password: ""} }
      expect(response).to render_template('new')
    end
  end

end
