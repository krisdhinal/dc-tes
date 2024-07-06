document.addEventListener('DOMContentLoaded', () => {
    const currencySelect = document.getElementById('product_currency');
    const priceField = document.getElementById('product_price');

    if (currencySelect) {
        currencySelect.addEventListener('change', () => {
        const selectedCurrency = currencySelect.value;
        const price = parseFloat(priceField.value);

        if (!isNaN(price)) {
            if (selectedCurrency === 'USD') {
            priceField.value = (price * 0.000070).toFixed(2); // Example conversion rate
            } else {
            priceField.value = (price / 0.000070).toFixed(2); // Example conversion rate
            }
        }
        });
    }
});
  