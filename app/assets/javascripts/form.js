//= require jquery
$(document).on("ready page:load", function(){
  $('.telephone').mask('+00 00 00000-0000');
  $('.postal-code').mask('00000-000');
  $('.cpf').mask('000.000.000-00', {reverse: true});
  $('.cns').mask('000 0000 0000 0000');
})