post '/sessions'  do
  @user = User.authenticate(params[:email], params[:password])
  if @user
    login(@user)
    redirect "/users/#{@user.id}"
  else
    @errors = []
    @errors << 'email or password was incorrect'
    erb :'users/index'
  end
end

delete '/sessions/:id' do
  logout
  redirect '/'
end


post '/sessions/game' do
  @new_game = Game.new(user_id: current_user.id, score: 0)
  if @new_game.save
    game_in(@new_game)
    @topic = Topic.find(params[:topic_id])
    @quiz = @topic.quizzes.first
    redirect "/users/#{current_user.id}/games/#{@topic.id}/#{@quiz.id}"
  else
    @errors = []
    @errors << @game.errors.full_messages
    erb :'games/new'
  end
end


delete 'sessions/game/:id' do
  game_out
  redirect 'users/show'
end



