post '/topic/:topic_id/quiz/:quiz_id/guess' do
    quiz = Quiz.find(params[:quiz_id])
    topic = Topic.find(params[:topic_id])
    user_guess = quiz.guesses.new(guess_body: params[:guess_body])
    user_guess.game_id = current_game.id
    user_guess.update_point(quiz)
    if user_guess.save
      @quiz = quiz.next_quiz
      if @quiz
        redirect "/users/#{current_user.id}/games/#{topic.id}/#{@quiz.id}"
      else
        redirect "/users/#{current_user.id}/games/#{current_game.id}"
      end
    else
      @errors = []
      @errors << user_guess.errors.full_messages
      erb :'quizzes/show'
    end
end
