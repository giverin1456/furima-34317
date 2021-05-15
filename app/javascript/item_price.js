function tax() {
  const itemPrice = document.getElementById("item-price");
  // id名を取得する
    itemPrice.addEventListener('change', () => {
      // イベントを発火の際に実行する関数を定義
      const price = itemPrice.value;
      // priceを入れた時に発火
      const addTaxPrice = document.getElementById("add-tax-price");
      const profit = document.getElementById("profit");
      const taxPrice = price * 0.1;
      const saleProfit = price - taxPrice;

      addTaxPrice.innerHTML = taxPrice;
      profit.innerHTML = saleProfit; 
  });
}
window.addEventListener("load" , tax);