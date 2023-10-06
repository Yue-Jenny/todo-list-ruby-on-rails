require "test_helper"

class TodosControllerTest < ActionDispatch::IntegrationTest
  test "should get todos" do
    get api_v1_todos_path, as: :json
    assert_response :success
  end
end
