require_relative '../../../rails_helper'

RSpec.describe 'Products', type: :request do
  # authenticate a user
  let(:admin) { create(:user, :is_admin) }
  let(:token) { JsonWebToken.encode(user_id: admin.id) }
  let(:headers) { {'Authorization' => "Bearer #{token}"} }
  let(:product_to_delete) { 
    Product.create(
      id: 10, 
      name: "Product To Be Deleted", 
      price: 19.99, 
      vegetarian: false,
      category: "entree",
      description: "description test"
    ) 
  }

  let(:product_params) do
    {
      name: "Product Name Test", 
      price: 12.24, 
      vegetarian: false, 
      category: "dessert", 
      description: "description pentru test products"
    }
  end

  describe 'POST /api/v1/products' do
    context 'when all fields are valid' do
      before do
        token
      end

      it 'should create a product' do
        expect { post "/api/v1/products", params: product_params, headers: headers }.to change(Product, :count).by(1)
        expect(response).to have_http_status(:created)
        expect(JSON.parse(response.body)).to include('id', 'name', 'price', 'vegetarian', 'category', 'description')
      end
    end
  end

  describe 'DELETE /api/v1/products/:id' do
    context 'user has admin role' do
      before do
        token
      end

      it 'should delete the product with id 10' do
        expect { delete "/api/v1/products/10", params: {id: 10}, headers: headers }.to change(Product, :count).by(-1)
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'GET /api/v1/products' do
    subject { get '/api/v1/products', headers: headers }

    context 'when there are products' do
      before do
        create_list(:product, 5)
        token

        subject
      end

      it 'should return all products' do
        expect(response).to have_http_status(:success)
        expect(JSON.parse(response.body).size).to eq(5)
        expect(JSON.parse(response.body)).to all(include('id', 'name', 'price', 'vegetarian', 'category', 'description'))
      end
    end

  end
end
