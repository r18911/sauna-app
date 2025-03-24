// const pay = () => {
//   const publicKey = gon.public_key
//   const payjp = Payjp(publicKey)
//   const elements = payjp.elements();
//   const numberElement = elements.create('cardNumber');
//   const expiryElement = elements.create('cardExpiry');
//   const cvcElement = elements.create('cardCvc');

//   numberElement.mount('#number-form');
//   expiryElement.mount('#expiry-form');
//   cvcElement.mount('#cvc-form');
//   const form = document.getElementById('charge-form')
//   form.addEventListener("submit", (e) => {
//     payjp.createToken(numberElement).then(function (response) {
//       if (response.error) {
//       } else {
//         const token = response.id;
//         const renderDom = document.getElementById("charge-form");
//         const tokenObj = `<input value=${token} name='token'  type="hidden">`;
//         renderDom.insertAdjacentHTML("beforeend", tokenObj);
//       }
//       numberElement.clear();
//       expiryElement.clear();
//       cvcElement.clear();
//       document.getElementById("charge-form").submit();
//     });
//     e.preventDefault();
//   });
// };

// window.addEventListener("turbo:load", pay);
// window.addEventListener("turbo:render", pay);

const pay = () => {
  const publicKey = gon.public_key;
  const payjp = Payjp(publicKey);
  const elements = payjp.elements();

  // 各カード情報の Element 作成
  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

  // フォームがページに存在する場合のみ実行
  const form = document.getElementById('charge-form');
  if (!form) return;

  // 入力欄を DOM にマウント（表示）
  numberElement.mount('#number-form');
  expiryElement.mount('#expiry-form');
  cvcElement.mount('#cvc-form');

  // フォーム送信イベント時の処理
  form.addEventListener("submit", (e) => {
    e.preventDefault(); // 先にデフォルトを止める

    payjp.createToken(numberElement).then(function (response) {
      if (response.error) {
        // エラー表示などはここで行えます（console.log でもOK）
        console.error(response.error.message);
        return;
      }

      const token = response.id;
      const tokenObj = `<input value="${token}" name='token' type="hidden">`;
      form.insertAdjacentHTML("beforeend", tokenObj);

      // フォーム送信実行
      form.submit();
    });
  });
};

// Turboで描画されたタイミングで実行
const initPay = () => {
  const form = document.getElementById('charge-form');
  if (form) pay();
};

window.addEventListener("turbo:load", initPay);
window.addEventListener("turbo:render", initPay);