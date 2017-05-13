$(document).ready(function(){
  $("#game").on("submit",function(e){
    e.preventDefault();
    // Get the segment indicated by the pointer on the wheel background which is at 0 degrees.
    // var winningSegment = theWheel.getIndicatedSegment().text;
    var form = $(this);
    console.log(theWheel.alertTopic());
    $.ajax({
        method: form.attr("method"),
        url: form.attr("action"),
        data: theWheel.alertTopic()
    })
    .done(function(response){
      $("#wheel").hide();
      $("main").append(response)
    })
    .fail(function(eresponse){
      alert(eresponse.responseText);
    })
  });
});

document.getElementById("home").addEventListener("click", switchActivate(), false);

function switchActivate() {
  console.log("hellow");
}
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
