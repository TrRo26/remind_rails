class CreateKeywords < ActiveRecord::Migration[5.0]
  def change
    create_table :keywords do |t|
      t.string :item, null: false
      t.string :name, null: false
      t.timestamps
    end
  end
end
