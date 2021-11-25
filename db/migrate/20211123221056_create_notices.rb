class CreateNotices < ActiveRecord::Migration[5.2]
  def change
    create_table :notices do |t|
      t.string :title
      t.text :content
      t.boolean :to_show

      t.timestamps
    end
  end
end
