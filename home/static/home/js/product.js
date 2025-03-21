document.getElementById("checkoutButton").addEventListener("click", function() {
    const productId = "{{ products.name }}";
    const quantity = document.getElementById("inputQuantity").value;
    fetch ("{% url 'checkout' %}", {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
            "X-CSRFToken": '{{ csrfToken }}',
        },
        body: JSON.stringify({ productId, quantity }),
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            alert("Product added to cart!");
        } else {
            alert("Failed to add product to cart!");
        }
    })
    .catch(error => {
        console.error("Error:", error);
    });
} );