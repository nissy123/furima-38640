window.addEventListener('load', () => {
const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  console.log(inputValue);

  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = Math.floor(priceInput.value * 0.1);

  const addPofitDom = document.getElementById("profit");
  addPofitDom.innerHTML = Math.rloor(priceInput.value - Math.floor(priceInput.value * 0.1 ))
})
});
