get '/users/index' do
  erb :'users/index'
end

get '/users/new' do
  erb :'users/new'
end

post '/users' do
  @user = User.new(params[:user])
  @user.password = params[:password]
  if @user.matching(params[:password],params[:confirm_password])
    @errors = ["Password is not matching."]
    erb :'users/new'
  elsif @user.save
    redirect '/users/index'
  else
    @errors = @user.errors.full_messages
    erb :'users/new'
  end
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/show'
end

get '/users/:id/all' do
  @user = User.find(params[:id])
  erb :'users/show_users_list'
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

get '/users/:user_id/games/:game_id' do
  @game = Game.find(params[:game_id])
  @game.total_score
  @game.save
  @user = User.find(params[:user_id])
  # set up a client to talk to the Twilio REST API
  @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
  if @user
    @client.messages.create(
      from: '+17314514935',
      to: '+18707406052',
      body: "Hi #{@user.first_name} #{@user.last_name}, your latest score is #{@game.score}."
    )
  end
  game_out
  erb :'games/show'
end

