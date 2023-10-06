module Api
    module V1
        class TodoDestroyService < ApplicationService
  
            def initialize(todo_id)
                @todo_id = todo_id
            end
          
            def call
                todo = Todo.find(@todo_id)

                destroy_todo_result = todo.destroy
                if destroy_todo_result
                    todo
                else
                    errors = todo.errors.full_messages
                    raise StandardError.new("Todo delete failed: #{errors.join(', ')}")
                end
            end
    
        end
    end
  end