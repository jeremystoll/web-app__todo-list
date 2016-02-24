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

  if @user.password == params[:user_password]
    session["user_id"] = @user.id

    erb :"/logins/success_login"
  else
    erb :"/error"
  end
end

MyApp.get "/logout" do

  erb :"/logins/logout"
end

MyApp.post "/process_logout" do

    session["user_id"] = nil

  erb :"/logins/success_logout"
end