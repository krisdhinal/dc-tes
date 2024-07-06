class SetDefaultCurrencyOnProducts < ActiveRecord::Migration[5.2]
  def change
    change_column_default :products, :currency, 'IDR'
  end
end
