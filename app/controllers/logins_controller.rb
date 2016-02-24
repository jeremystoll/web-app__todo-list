# This controller is for all the CRUD operations related to a Login.

# Note that "logins" are not stored in the database. But there is still
# a reasonable way to think about a "login" as a resource which is created
# and deleted (i.e. 'logging out').
# 
# Reading and Updating a login, however, make a little less sense.

MyApp.get "/" do

  erb :"/home_page"
end


MyApp.post "/login" do

  @user = User.find_by_email(params[:user_email])

  if @user.password == params[:user_password]
    session["user_id"] = @user.id

    erb :"/logins/login"
  else
    erb :"/error"
  end
end


MyApp.post "/logout" do

    session["user_id"] = nil

  erb :"/logins/logout"
end