function item_price() {
  const priceInput = document.getElementById("item-price");
  
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);

    const salesCommission = document.getElementById("add-tax-price")
    salesCommission.innerHTML = (Math.floor(inputValue * 0.1));
    console.log(salesCommission);
    
    const salesProfit = document.getElementById("profit")
    const calculationResult = inputValue * 0.1
    console.log(calculationResult);
    salesProfit.innerHTML =(Math.floor(inputValue - calculationResult));
    console.log(salesProfit);
 });
}

window.addEventListener("load", item_price);