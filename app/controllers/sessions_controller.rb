get '/session-viewer' do
  session.inspect
end

post '/sessions'  do
  @user = User.authenticate(params[:email], params[:password])
  if @user
    login(@user)
    redirect "/users/#{@user.id}"
  else
    @errors = ['email or password was incorrect']
    erb :'users/index'
  end
end

delete '/sessions/:id' do
  logout
  redirect '/'
end

post '/games/topic' do
  @new_game = Game.new(user_id: current_user.id, score: 0)
  if request.xhr? && @new_game.save
    status 200
    params.keys.first
    @topic = Topic.find_by(topic_name: params.keys.first)
    @quiz = @topic.quizzes.first
    erb :'quizzes/show', layout: false
  elsif request.xhr?
    status 422
    content_type :json
    @topic.errors.full_messages.to_json
  elsif @new_game.save
    status 200
    game_in(@new_game)
    @topic = Topic.all.sample
    @quiz = @topic.quizzes.first
    redirect "/users/#{current_user.id}/games/#{@topic.id}/#{@quiz.id}"
  else
    status 422
    @errors = @game.errors.full_messages
    erb :'games/new'
  end
end


delete '/topic/:topic_id/quiz/:quiz_id/guess' do
  status 200
  redirect "/users/#{current_user.id}/games/#{current_game.id}"
end



