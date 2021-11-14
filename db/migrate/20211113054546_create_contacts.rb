class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.integer :user_id
      t.text :content
      t.string :email
      t.boolean :have_replied

      t.timestamps
    end
  end
end
