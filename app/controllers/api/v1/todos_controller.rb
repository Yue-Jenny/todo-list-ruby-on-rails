class TodosController < ApplicationController
  def index
    @todo = Todo.all
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      render json: { status: "success", data: @todo }, status: :created
    else
      render json: { status: "error", errors: @todo.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    @todo = Todo.find(params[:id])
  end

  private
    def todo_params
      params.require(:todo).permit(:title)
    end
end
