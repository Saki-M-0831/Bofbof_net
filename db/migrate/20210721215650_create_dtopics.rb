class CreateDtopics < ActiveRecord::Migration[5.2]
  def change
    create_table :dtopics do |t|
      t.integer :post_id
      t.string :content
      t.boolean :is_chosen

      t.timestamps
    end
  end
end
