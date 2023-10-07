# frozen_string_literal: true

module Api
  module V1
    class TodoShowService < ApplicationService
      def initialize(todo_id)
        @todo_id = todo_id
      end

      def call
        Todo.find(@todo_id)
      end
    end
  end
end
