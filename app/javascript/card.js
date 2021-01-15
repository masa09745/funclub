$(document).on('turbolinks:load', function() {

  const payjp = Payjp('pk_test_0f209ec3d7c9a45a8d950a55');

  var elements = payjp.elements();
  var numberElement = elements.create('cardNumber');
  var expElement = elements.create('cardExpiry');
  var cvcElement = elements.create('cardCvc');

  numberElement.mount('#number');
  expElement.mount('#exp');
  cvcElement.mount('#cvc');

  $("#token-submit").click(function(e) {
    e.preventDefault();
    payjp.createToken(numberElement).then(function (r) {
      if (r.error){
        alert(r.error.message)
        regist_card.prop('disabled', false)
      }
      else{
        alert('登録完了')
        $('#token').append(
          `<input type="hidden" name="payjp_token" value=${r.id}>
            <input type="hidden" name="card_token" value=${r.card.id}>`
          );
          $('#credit_form')[0].submit();
        　 //  ↑↑　ここでtype='hidden'にしてsubmitにtokenを乗せています

          $("#number").removeAttr("name");
          $("#cvc").removeAttr("name");
          $("#exp").removeAttr("name");
      };
    });
  });
});