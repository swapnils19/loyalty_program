require "rails_helper"

RSpec.describe UsersController, type: :controller do
  describe 'GET show' do
    def create_user
      User.create! name: 'Test'
    end

    it 'returns a 200' do
      get :show, params: { id: create_user.id }
      expect(response).to have_http_status(:ok)
    end

    it 'defines instance variables' do
      created_user = create_user
      get :show, params: { id: created_user.id }

      user = assigns(:user)
      total_loyalty_points = assigns(:total_loyalty_points)
      loyalty_rewards = assigns(:loyalty_rewards)

      expect(user).to eq(created_user)
      expect(total_loyalty_points).to be 0
      expect(loyalty_rewards.size).to be 0
    end
  end

  describe 'POST create' do
    it 'creates user' do
      user_name = 'Test User'
      post :create, params: { user: { name: user_name } }
      user = assigns(:user)

      expect(response).to have_http_status(302)
      expect(user.name).to eq user_name
    end

    it 'renders to new' do
      post :create, params: { user: { name: '' } }

      expect(response).to render_template(:new)
    end
  end
end
