# This controller is for all the CRUD operations related to a User.
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

MyApp.get "/delete_user" do

erb :"users/delete_user"
end
