require_relative '../../../rails_helper'

RSpec.describe 'Users', type: :request do
  # authenticate a user
  let(:admin) { create(:user, :is_admin) }
  let(:token) { JsonWebToken.encode(user_id: admin.id) }
  let(:headers) { {'Authorization' => "Bearer #{token}"} }

  let(:user_params) do
    {
      name: "Franci Admin",
      email: "franci.test3@admin.com",
      password: "admin123",
      password_confirmation: "admin123"
    }
  end

  describe 'POST /api/v1/users' do
    context 'when all fields are valid' do
      it 'should create a user' do
        expect { post "/api/v1/users", params: user_params }.to change(User, :count).by(1)
        expect(response).to have_http_status(:created)
        expect(JSON.parse(response.body)).to include('id', 'name', 'role')
      end
    end
  end

  describe 'GET /api/v1/users' do
    subject { get '/api/v1/users', headers: headers }

    context 'when there are users' do
      before do
        create_list(:user, 3)
        token

        subject
      end

      it 'should return all users' do
        puts JSON.parse(response.body)
        expect(response).to have_http_status(:success)
        expect(JSON.parse(response.body).size).to eq(4) # includes the created admin above
        expect(JSON.parse(response.body)).to all(include('id', 'name', 'role'))
      end
    end

  end
end
