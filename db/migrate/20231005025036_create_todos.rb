class CreateTodos < ActiveRecord::Migration[7.0]
  def change
    create_table :todos do |t|
      t.string :title

      # 在這個表格分別建立出 created_at 以及 updated_at 兩個時間戳記欄位
      t.timestamps
    end
  end
end
