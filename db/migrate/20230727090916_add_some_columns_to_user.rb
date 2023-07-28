class AddSomeColumnsToUser < ActiveRecord::Migration[7.0]
  def change
    create_table "users", force: :cascade do |t|
      t.string "username"
    end
  end
end
