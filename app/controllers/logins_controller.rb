# This controller is for all the CRUD operations related to a Login.

# Note that "logins" are not stored in the database. But there is still
# a reasonable way to think about a "login" as a resource which is created
# and deleted (i.e. 'logging out').
# 
# Reading and Updating a login, however, make a little less sense.

MyApp.get "/login" do

  erb :"/logins/login"
end

MyApp.post "/process_login" do

  @user = User.find_by_email(params[:user_email])
  if @user == nil
    @errors = []
    @errors << "Your existence has been called into question. Please try again, or add yourself as a user."
    erb :"/login_error"
  elsif @user.password == params[:user_password]
    session["user_id"] = @user.id
    redirect :"/see_all_todos"
  else
    @errors = []
    @errors << "Your password is incorrect. Please try again."
    erb :"/login_error"
  end
end

MyApp.get "/logout" do
  if User.is_user_logged_in(session[:user_id]) == false
    @errors = []
    @errors << "You must be logged in to Log out. Is this unclear?"
    erb :"/login_error"
  else 
    erb :"/logins/logout"
  end
end

MyApp.post "/process_logout" do
  session["user_id"] = nil
  redirect :"/login"
end