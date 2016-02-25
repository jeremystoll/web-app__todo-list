MyApp.get "/" do
  binding.pry
  session[:user_id] = nil
  binding.pry
  erb :"home_page"
end

MyApp.get "/create_user" do
  binding.pry
  if User.is_user_logged_in == false
    binding.pry
    @errors = []
    @errors << "You must be logged in to create a new user."
    erb :"/login_error"
  else 
  binding.pry
  erb :"users/create_user"
  end
end

MyApp.post "/process_create_user" do

  @user_new = User.new
  
  @user_new.email = params[:user_email]
  @user_new.password = params[:user_password]
  @user_new.save

  erb :"users/success_create_user"
end

MyApp.get "/edit_user" do

  erb :"users/edit_user"
end

MyApp.post "/process_edit_user" do
  @user = User.find_by_id(session["user_id"])
    @user.name = params[:user_new_name]
    @user.email = params[:user_new_email]
    @user.password = params[:user_new_password]
    @user.save
  erb :"users/success_edit_user"
end

MyApp.get "/delete_user" do

  @users = User.all

  erb :"users/delete_user"
end


MyApp.post "/process_delete_user" do

  @user = User.find_by_id(session["user_id"])
    @user.delete
  erb :"users/success_delete_user"
end

MyApp.get "/see_all_users" do

  @users = User.all

erb :"users/see_all_users"
end

