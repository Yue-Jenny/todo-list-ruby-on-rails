# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Api::V1::Todos", type: :request do
  describe "GET /index" do
    # let! : 表示在每個 it 區塊開始之前都先執行此塊的內容。See: https://rspec.info/features/3-12/rspec-core/helper-methods/let/
    # 關於 create_list。See: https://thoughtbot.github.io/factory_bot/building-or-creating-multiple-records/summary.html
    let!(:todos) { create_list(:todo, 3) }

    before { get api_v1_todos_path }

    it 'returns todos' do
      expect(json).not_to be_empty
      expect(json['data'].size).to eq(3)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /create" do
    let(:valid_attributes) { { todo: { title: 'Learn RSpec' } } }

    context 'when the request is valid' do
      before { post api_v1_todos_path, params: valid_attributes }

      it 'creates a todo' do
        expect(json['data']['title']).to eq('Learn RSpec')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post api_v1_todos_path, params: { todo: { title: '' } } }

      it 'returns status code 500' do
        expect(response).to have_http_status(500)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/error/)
      end
    end
  end

  # Helper method to parse response body to JSON
  def json
    JSON.parse(response.body)
  end
end
