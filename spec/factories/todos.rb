# frozen_string_literal: true

FactoryBot.define do
  factory :todo do
    title { 'Sample Todo Title' }
    # 可以加入其他預設的屬性值，如：
    # description { "Sample description for the todo." }
  end
end
