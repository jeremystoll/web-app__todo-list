MyApp.get "/create_todo" do
  if User.is_user_logged_in(session[:user_id]) == false
    @errors = []
    @errors << "You must be logged in to create a To-Do."
    erb :"/login_error"
  else 
    @users = User.all
    erb :"/todos/create_todo"
  end  
end


MyApp.post "/process_create_todo" do
  if User.is_user_logged_in(session[:user_id]) == false
    @errors = []
    @errors << "You must be logged in to create a To-Do."
    erb :"/login_error"
  else 
    @todo = Todo.new
    @todo.title = params[:todo_title]
    @todo.description = params[:todo_description]
    @todo.created_by = session[:user_id]
    @todo.user_id = params[:todo_user_id] 
    @todo.save
    
    erb :"/todos/success_create_todo"
  end
end


MyApp.get "/edit_todo/:todo_id" do
  if User.is_user_logged_in(session[:user_id]) == false
    @errors = []
    @errors << "You must be logged in to edit a To-Do."
    erb :"/login_error"
  else 
    @todo = Todo.find_by_id(params[:todo_id])
    erb :"/todos/edit_todo"
  end
end


MyApp.post "/process_edit_todo/:todo_id" do
  if User.is_user_logged_in(session[:user_id]) == false
    @errors = []
    @errors << "You must be logged in to create a To-Do."
    erb :"/login_error"
  else 
    @todo = Todo.find_by_id(params[:todo_id])
    @todo.title = params[:todo_title]
    @todo.description = params[:todo_description]
    @todo.completed = params[:completed]
    @todo.user_id = params[:user_id]
    @todo.save
    erb :"/todos/success_edit_todo"
  end
end

MyApp.get "/delete_todo" do
  if User.is_user_logged_in(session[:user_id]) == false
    @errors = []
    @errors << "You must be logged in to delete a To-Do."
    erb :"/login_error"
  else 
    erb :"/todos/delete_todo"
  end
end

MyApp.post "/process_delete_todo" do

  if User.is_user_logged_in(session[:user_id]) == false
    @errors = []
    @errors << "You must be logged in to delete a To-Do."
    erb :"/login_error"
  else 
    @todo = Todo.find_by(:user_id => (session[:user_id]), :title => (params[:todo_title]))
    @todo.delete
    erb :"/todos/success_delete_todo"
  end
end

MyApp.get "/see_all_todos" do
  
  if User.is_user_logged_in(session[:user_id]) == false
    @errors = []
    @errors << "You must be logged in to create a To-Do."
    erb :"/login_error"
  else 
    @user = User.find_by_id(session[:user_id])
    @users = User.all
    @todos = Todo.all
    erb :"/todos/see_all_todos"
  end
end

