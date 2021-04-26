class CreateBaloons < ActiveRecord::Migration[6.1]
  def change
    create_table :baloons do |t|
      t.string :name
      t.integer :quantity
      t.integer :user_id, foreign_key: true

      t.timestamps
    end
  end
end
