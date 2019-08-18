class CreateUser < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, index: true, null: false, unique: true
      t.string :password_digest, index: true, null: false
      t.string :token, index: true
      t.timestamps
    end
  end
end
