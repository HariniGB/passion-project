get '/users/index' do
  erb :'users/index'
end

get '/users/new' do
  erb :'users/new'
end

post '/users' do
  @errors = []
  @user = User.new(params[:user])
  @user.password = params[:password]
  if @user.matching(params[:password],params[:confirm_password])
    @errors << "Password is not matching."
    erb :'users/new'
  elsif @user.save
    redirect '/users/index'
  else
    @errors << @user.errors.full_messages
    erb :'users/new'
  end
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/show'
end

get '/users/:id/edit' do
  @user = User.find(params[:id])
  if logged_in?
    erb :'users/edit'
  else
    redirect '/'
  end
end

put '/users/:id' do
  @user = User.find(params[:id]).update(params[:user])
  redirect '/'
end

delete '/users/:id' do
  @user = User.find(params[:id])
  logout
  @user.destroy
  redirect '/'
end

get '/users/:user_id/games/new' do
  erb :'games/new'
end

get '/users/:user_id/games/:topic_id/:quiz_id' do
  @topic = Topic.find(params[:topic_id])
  @quiz = Quiz.find(params[:quiz_id])
  erb :'quizzes/show'
end

post '/user/:user_id/games/:game_id/guess' do
  @user = User.find(params[:user_id])
  @game = @user.game.new(params[:game])
  if @game.save
    redirect "/users/#{@user.id}"
  else
    @errors = []
    @errors << @game.errors.full_messages
    erb :'games/new'
  end
end

get '/users/:user_id/games/show' do
  erb :'games/show'
end

