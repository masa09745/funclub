$(document).on('turbolinks:load', function() {
  if(document.URL.match(/step3/)||document.URL.match(/card/)||document.URL.match(/edit/)){
    const payjp = Payjp('pk_test_0f209ec3d7c9a45a8d950a55');

    var elements = payjp.elements();
    var numberElement = elements.create('cardNumber');
    var expElement = elements.create('cardExpiry');
    var cvcElement = elements.create('cardCvc');

    numberElement.mount('#number');
    expElement.mount('#exp');
    cvcElement.mount('#cvc');

    $("#token-submit").on("click",function(e) {
      e.preventDefault();
      payjp.createToken(numberElement).then(function (r) {
        if (r.error){
          alert(r.error.message)
          regist_card.prop('disabled', false)
        }
        else{
          $('#credit-form').append(
            `<input type="hidden" name="payjp_token" value=${r.id}>
             <input type="hidden" name="card_token" value=${r.card.id}>`
            );
            $('#credit-form')[0].submit();
          　 //  ↑↑　ここでtype='hidden'にしてsubmitにtokenを乗せています

            $("#number").removeAttr("name");
            $("#cvc").removeAttr("name");
            $("#exp").removeAttr("name");
        };
      });
    });
  };
});