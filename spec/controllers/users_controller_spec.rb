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

    it "forwards to the index page when logged in already"

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

    it "doesn't work when a user is already logged in"

    it "fails to create a new user if the user params aren't entirely complete"
  end

end
