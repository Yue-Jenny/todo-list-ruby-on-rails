# frozen_string_literal: true

module Api
  module V1
    class TodoCreatorService < ApplicationService
      def initialize(todo_params)
        @todo_params = todo_params
      end

      def call
        todo = Todo.new(@todo_params)
        if todo.save
          todo
        else
          errors = todo.errors.full_messages
          raise StandardError, "Todo creation failed: #{errors.join(', ')}"
        end
      end
    end
  end
end
