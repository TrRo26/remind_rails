class Name < ActiveRecord::Migration[5.0]
  def change
    change_table(:users) do |t|
    t.string :username
    t.string :password_digest
    t.string :facebook_id
    t.timestamps
    end
  end
end
