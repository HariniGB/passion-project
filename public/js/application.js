$(document).ready(function() {
  $("#answer_quiz").on("submit", function(e){
    e.preventDefault();
    var formInputs = $(this);
    var userGuess = formInputs.serialize();
    if userGuess.guess_body != {}
      $.ajax({
        method: formInputs.attr("method"),
        url:    formInputs.attr("action"),
        data:   userGuess
      })
    else
    var error = "Must select at-least one option"
      $.ajax({
        method: formInputs.attr("method"),
        url:    formInputs.attr("action"),
        data:   error
      })
  })
});
