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

  @todo = Todo.find_by(:user_id => (session[:user_id]), :title => (params["todo_title"]))
  
  @todo.description = params[:todo_description]
  @todo.save

  erb :"/todos/success_edit_todo"
end

MyApp.get "/delete_todo" do

  erb :"/todos/delete_todo"
end

MyApp.post "/process_delete_todo" do

  erb :"/todos/success_delete_todo"
end


