class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.string :link
      t.string :title
      t.text :content
      t.string :picture

      t.timestamps
    end
  end
end
