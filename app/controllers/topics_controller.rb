post '/topic/:topic_id/quiz/:quiz_id/guess' do
  if request.xhr?
    if params[:error]
      @error = params[:error]
      erb :'quizzes/show'
    else
      quiz = Quiz.find(params[:quiz_id])
      user_guess = quiz.guesses.new(params[:userGuess])
      user_guess.game_id = current_game.id
      user_guess.update_point(quiz)
      if user_guess.save



      else
        @errors = user_guess.errors.full_messages
        erb :'quizzes/show'
      end


      # @topic = Topic.find(params[:topic_id])
      # next_quiz = Quiz.find(params[:next_quiz_id])
      # if input_guess.save
      #   if @topic.valid_quiz(@next_quiz)
      #     @quiz = @next_quiz
      #   else
      #     redirect "/users/#{session[:id]}/game/show"
    end
  end
end
