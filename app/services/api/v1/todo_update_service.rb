module Api
  module V1
    class TodoUpdateService < ApplicationService

      def initialize(todo_id, todo_params)
        @todo_id = todo_id
        @todo_params = todo_params
      end
    

      def call
        todo = Todo.find(@todo_id)
        raise StandardError.new("Todo not found") unless todo

        updated_todo = todo.update(@todo_params)
        if updated_todo
          updated_todo
        else
          errors = updated_todo.errors.full_messages
          raise StandardError.new("Todo update failed: #{errors.join(', ')}")
        end
      end

    end
  end
end