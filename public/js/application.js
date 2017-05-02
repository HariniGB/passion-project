// $(document).ready(function() {
  // $("#answer_quiz").on("submit", function(e){
  //   e.preventDefault();
  //   var formInputs = $(this);
  //   var userGuess = $("input[name='guess_body']:checked").serialize();
  //   debugger;
  //   if(userGuess.guess_body != ""){
  //       $.ajax({
  //         method: formInputs.attr("method"),
  //         url:    formInputs.attr("action"),
  //         data:   userGuess
  //       })
  //     .done(function(response){
  //       $('#wrapper').empty()
  //       $('#wrapper').append(response);
  //     })
  //   }
  //   else{
  //     console.log(userGuess)
  //     var error = "Must select at-least one option"
  //       $.ajax({
  //         method: formInputs.attr("method"),
  //         url:    formInputs.attr("action"),
  //         data:   error
  //       })
  //     .done(function(response){
  //       console.log("response inside error :" + response);
  //       $('#show-error').append(response);
  //   })
  //   }
  // })
// });
