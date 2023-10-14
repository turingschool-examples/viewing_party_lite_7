# I know that someone said that we did not need to test the controllers, but our simplecov was only at 60% for this controller so i added this. 
require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #show' do
    it 'assigns the requested user to @user' do
      user = User.create(name: 'Test User', email: 'test@example.com')
      get :show, params: { id: user.id }
      expect(assigns(:user)).to eq(user)
    end

    it 'sets the user ID in the session' do
      user = User.create(name: 'Test User', email: 'test@example.com')
      get :show, params: { id: user.id }
      expect(session[:user_id]).to eq(user.id)
    end

    it 'renders the show template' do
      user = User.create(name: 'Test User', email: 'test@example.com')
      get :show, params: { id: user.id }
      expect(response).to render_template('show')
    end
  end

  describe 'GET #new' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new user' do
        post :create, params: { name: 'New User', email: 'newuser@example.com' }
        expect(User.last.name).to eq('New User')
        expect(User.last.email).to eq('newuser@example.com')
      end

      it 'redirects to the user profile page' do
        post :create, params: { name: 'New User', email: 'newuser@example.com' }
        expect(response).to redirect_to(user_path(User.last))
      end
    end

    context 'with invalid parameters' do
      it 'renders the new template' do
        post :create, params: { name: 'Invalid User', email: '' }
        expect(response).to render_template('new')
      end
    end
  end
end
