get '/users/new' do
  erb :'users/new'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    redirect '/'
  else
    @errors = @user.errors.full_messages
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

