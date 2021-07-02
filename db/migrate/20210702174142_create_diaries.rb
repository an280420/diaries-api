class CreateDiaries < ActiveRecord::Migration[6.1]
  def change
    create_table :diaries do |t|
      t.string :title, null: false
      t.datetime :expiration
      t.integer :kind, null: false

      t.timestamps
    end
  end
end
