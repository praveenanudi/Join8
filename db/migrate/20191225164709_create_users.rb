class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :login
      t.string :password
      t.string :title
      t.string :lastname
      t.string :firstname
      t.string :gender
      t.string :email
      t.string :picture
      t.text :address

      t.timestamps
    end
  end
end
