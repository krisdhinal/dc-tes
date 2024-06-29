import consumer from "./consumer"

consumer.subscriptions.create("ProductChannel", {
  connected() {
    console.log("Connected to ProductChannel")
  },

  disconnected() {
    console.log("Disconnected from ProductChannel")
  },

  received(data) {
    console.log("Received data:", data)
    const productElement = document.getElementById(`product_${data.id}`);
    if (productElement) {
      productElement.outerHTML = data.html;
    } else {
      const productList = document.getElementById("product_list");
      productList.insertAdjacentHTML('beforeend', data.html);
    }
  }
});
