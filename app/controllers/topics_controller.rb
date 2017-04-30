post '/topic/:topic_id/quiz/:quiz_id/guess' do
  if request.xhr?
    p params
    if params[:userGuess]
      quiz = Quiz.find(params[:quiz_id])
      user_guess = quiz.guesses.new(guess_body: params[:userGuess])
      user_guess.game_id = current_game.id
      user_guess.update_point(quiz)
      if user_guess.saves
        @quiz = quiz.next_quiz
        erb :'_next_quiz', layout: false
      else
        @errors = []
        @errors << user_guess.errors.full_messages
        erb :'quizzes/show', layout: false
      end
    else
      params[:error]
      @error = params[:error]
      erb :'quizzes/show', layout: false
    end
  end
end
