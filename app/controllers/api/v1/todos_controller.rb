# frozen_string_literal: true

module Api
  module V1
    class TodosController < ApplicationController
      def index
        all_todos = Todo.all
        render json: { status: 'success', data: all_todos }, status: :ok
      end

      def create
        todo = TodoCreatorService.call(todo_params)
        render json: { status: 'success', data: todo }, status: :created
      rescue StandardError => e
        render json: { status: 'error', errors: e.message }, status: :internal_server_error
      end

      def update
        updated_todo = TodoUpdateService.call(params[:id], todo_params)
        render json: { status: 'success', data: updated_todo }, status: :ok
      rescue ActiveRecord::RecordNotFound
        render json: { status: 'error', errors: 'Todo not found' }, status: :not_found
      rescue StandardError => e
        render json: { status: 'error', errors: e.message }, status: :internal_server_error
      end

      def destroy
        destroy_todo = TodoDestroyService.call(params[:id])
        render json: { status: 'success', data: destroy_todo }, status: :ok
      rescue ActiveRecord::RecordNotFound
        render json: { status: 'error', errors: 'Todo not found' }, status: :not_found
      rescue StandardError => e
        render json: { status: 'error', errors: e.message }, status: :internal_server_error
      end

      def show
        found_todo = TodoShowService.call(params[:id])
        render json: { status: 'success', data: found_todo }, status: :ok
      rescue ActiveRecord::RecordNotFound
        render json: { status: 'error', errors: 'Todo not found' }, status: :not_found
      rescue StandardError => e
        # This catches any other unexpected error.
        render json: { status: 'error', errors: e.message }, status: :internal_server_error
      end

      private

      # Strong Parameters
      def todo_params
        params.require(:todo).permit(:title)
      end
    end
  end
end
