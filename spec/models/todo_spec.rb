# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Todo, type: :model do
  # 使用 FactoryBot 來建立有效的 Todo
  # Returns a Todo instance that's not saved
  let(:todo) { build(:todo) }

  describe 'validations' do
    it 'is valid with a title' do
      expect(todo).to be_valid
    end

    it 'is invalid without a title' do
      todo.title = nil
      expect(todo).to_not be_valid
      expect(todo.errors.messages[:title]).to include("can't be blank")
    end
  end
end
