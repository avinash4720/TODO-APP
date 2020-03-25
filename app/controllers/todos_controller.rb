# todos_controller.rb
class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token
    def index
      render plain: Todo.order(:id).map{|todo| todo.pls_string}.join("\n")
    end
    def show
      id=params[:id]
      todo=Todo.find(id)
      render plain: todo.pls_string
    end
    def create
      todo_text=params[:todo_text]
      due_date=DateTime.parse(params[:due_date])
      new_todo=Todo.create!(todo_text: todo_text,due_date: due_date,completed: false)
      response="Hey you created with id #{new_todo.id}"
      render plain: response
    end
    def update
      id=params[:id]
      completed= params[:completed]
      todo=Todo.find(id)
      todo.completed= completed
      todo.save!
      render plain: "updated todo with completed status to #{completed}"
    end
  end
  