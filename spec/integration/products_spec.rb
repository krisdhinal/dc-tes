require 'swagger_helper'

describe 'Products API' do
  path '/products' do
    get 'Retrieves all products' do
      tags 'Products'
      produces 'application/json'

      response '200', 'products found' do
        schema type: :array, items: { type: :object, properties: {
          id: { type: :integer },
          name: { type: :string },
          description: { type: :string },
          price: { type: :number }
        }}

        run_test!
      end
    end
  end

  path '/products/{id}' do
    get 'Retrieves a product' do
      tags 'Products'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '200', 'product found' do
        schema type: :object, properties: {
          id: { type: :integer },
          name: { type: :string },
          description: { type: :string },
          price: { type: :number }
        }

        let(:id) { Product.create(name: 'Sample', description: 'Sample product', price: 12.34).id }
        run_test!
      end

      response '404', 'product not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
