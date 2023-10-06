module Api
  module V1
    class TodosController < ApplicationController
      def index
        @all_todos = Todo.all
        render json: @all_todos
      end

      def create
        begin
          @todo = TodoCreatorService.call(todo_params)
          render json: { status: "success", data: @todo }, status: :created
        rescue StandardError => e
          render json: { status: "error", errors: e.message }, status: :unprocessable_entity
        end
      end

      def update
        begin
          @updated_todo = TodoUpdateService.call(params[:id], todo_params)
          render json: { status: "success", data: @updated_todo }, status: :ok
        rescue StandardError => e
          render json: { status: "error", errors: e.message }, status: :unprocessable_entity
        end
      end

      def destroy
        @todo = Todo.find(params[:id])
        if @todo.destroy
          render json: { status: "success", message: "Todo was successfully deleted." }, status: :ok
        else
          render json: { status: "error", message: "Failed to delete the todo." }, status: :unprocessable_entity
        end
      end

      def show
        @todo = Todo.find(params[:id])
        render json: @todo
      end

      private
      # Strong Parameters
        def todo_params
          params.require(:todo).permit(:title)
        end
    end
  end
end