post '/login'  do
  @user = User.authenticate(params[:email], params[:password])
  if @user
    login(@user)
    redirect "/users/#{@user.id}"
  else
    @errors = ['email or password was incorrect']
    erb :'users/index'
  end
end

delete '/logout' do
  logout
  redirect '/'
end
