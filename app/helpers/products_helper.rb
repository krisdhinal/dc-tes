module ProductsHelper
    def formatted_price(product)
        currency_symbol = product.currency == 'USD' ? '$' : 'Rp'
        "#{currency_symbol} #{number_to_currency(product.converted_price, unit: '', precision: 2)}"
    end
end
