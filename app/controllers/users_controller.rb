MyApp.get "/" do

erb :"home_page"
end

MyApp.get "/create_user" do

erb :"users/create_user"
end

MyApp.post "/process_create_user" do

  @user_new = User.new
  
  @user_new.email = params[:user_email]
  @user_new.password = params[:user_password]
  @user_new.save

erb :"users/success_create_user"
end

MyApp.get "/update_user" do

erb :"users/update_user"
end

MyApp.post "/process_update_user" do

@user = User.find_by_email(params[:user_email])
  if @user.password == params[:user_password]
    @user.password = params[:user_new_password]
    @user.save
    erb :"users/success_update_user"
  else
    erb :"/error"
  end
end

MyApp.get "/delete_user" do

  @users = User.all

erb :"users/delete_user"
end

MyApp.post "/process_delete_user" do

@user = User.find_by_email(params[:user_email])
  if @user.password == params[:user_password]
    @user.delete
    erb :"users/success_delete_user"
  else
    erb :"error"
  end
end

MyApp.get "/see_all_users" do

  @users = User.all

erb :"users/see_all_users"
end

MyApp.post "/admin/delete_user/:user_id" do
  @user_del = User.find_by_id(params[:user_id])
  @user_del.delete
  @users = User.all
erb :"users/see_all_users"
end


