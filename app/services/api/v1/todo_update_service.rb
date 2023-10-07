# frozen_string_literal: true

module Api
  module V1
    class TodoUpdateService < ApplicationService
      def initialize(todo_id, todo_params)
        @todo_id = todo_id
        @todo_params = todo_params
      end

      def call
        todo = Todo.find(@todo_id)
        updated_todo_result = todo.update(@todo_params)
        if updated_todo_result
          todo
        else
          errors = todo.errors.full_messages
          raise StandardError, "Todo update failed: #{errors.join(', ')}"
        end
      end
    end
  end
end
