class Product < ApplicationRecord
    after_create_commit { broadcast_product }
    after_update_commit { broadcast_product }
    after_destroy_commit { broadcast_destroy }
  
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
  