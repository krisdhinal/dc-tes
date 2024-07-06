class Product < ApplicationRecord
    validates :name, presence: { message: "Title can't be blank" }, length: { maximum: 100, message: "Name is too long (maximum is 100 characters)" }
    validates :description, presence: { message: "Description can't be blank" }, length: { maximum: 500, message: "Description is too long (maximum is 500 characters)" }
    validates :price, presence: { message: "Price can't be blank" }, numericality: { greater_than_or_equal_to: 0, message: "Price must be a positive number" }
    validates :currency, presence: true, inclusion: { in: %w[IDR USD] }

    after_create_commit { broadcast_product }
    after_update_commit { broadcast_product }
    after_destroy_commit { broadcast_destroy }

    def converted_price
      return price if currency == 'IDR'
      price * conversion_rate_to_usd
    end
  
    def conversion_rate_to_usd
      # Here you can define a fixed rate or fetch it from a service
      0.000070 # Example rate: 1 IDR = 0.000070 USD
    end
  
    private
  
    def broadcast_product
      Rails.logger.info "Broadcasting product ##{self.id}"
      ActionCable.server.broadcast "product_channel", {
        id: self.id,
        html: ApplicationController.render(partial: 'products/product', locals: { product: self })
      }
    end
  
    def broadcast_destroy
      Rails.logger.info "Broadcasting product destroy ##{self.id}"
      ActionCable.server.broadcast "product_channel", {
        id: self.id,
        html: ''
      }
    end
  end
  