MyApp.get "/create_todo" do

  erb :"/todos/create_todo"  
end


MyApp.post "/process_create_todo" do

  @todo = Todo.new
  @todo.title = params[:todo_title]
  @todo.description = params[:todo_description]
  @todo.user_id = session[:user_id]
  @todo.save
  
  erb :"/todos/success_create_todo"
end


MyApp.get "/edit_todo" do

  erb :"/todos/edit_todo"
end


MyApp.post "/process_edit_todo" do

  @todo = Todo.find_by(:user_id => (session[:user_id]), :title => (params[:todo_title]))
  binding.pry
  @todo.description = params[:todo_description]
  @todo.save

  erb :"/todos/success_edit_todo"
end

MyApp.get "/delete_todo" do

  erb :"/todos/delete_todo"
end

MyApp.post "/process_delete_todo" do

  if User.is_user_logged_in 
    @todo = Todo.find_by(:user_id => (session[:user_id]), :title => (params[:todo_title]))
    @todo.delete
    erb :"/todos/success_delete_todo"
  else
    erb :"/login_error"
  end
end

MyApp.get "/see_all_todos" do
  
  if User.is_user_logged_in 
    @todos = Todo.all
    erb :"/todos/see_all_todos"
  else
    erb :"/login_error"
  end
end

