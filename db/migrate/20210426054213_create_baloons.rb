class CreateBaloons < ActiveRecord::Migration[6.1]
  def change
    create_table :baloons do |t|
      t.string :name
      t.integer :quantity

      t.timestamps
    end
  end
end
