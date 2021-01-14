$(document).on('turbolinks:load', function() {
  var form = $('#credit-form');
  Payjp.setPublicKey('pk_test_0f209ec3d7c9a45a8d950a55');

  form.on('click', '#token-submit', function(e) {
    e.preventDefault();
    form.find('#token-submit').prop('disabled', true);

    var card = {
      number: $('#number').val(),
      cvc: $('#cvc').val(),
      exp_month: $('#exp_month').val(),
      exp_year: $('#exp_year').val(),
    };

    Payjp.createToken(card, function(status, response) {
      if (status == 200) {
        $('#number').removeAttr('name');
        $('#cvc').removeAttr('name');
        $('#exp_month').removeAttr('name');
        $('#exp_year').removeAttr('name');

        var token = response.id;
        console.log(token)

        form.append($('<input type="hidden" name="payjp-token">').val(token));
        form.get(0).submit();
        }
      else {
        alert("正しいカード情報を入力してください");
      }
    });
  });
});