class CreateReplies < ActiveRecord::Migration[5.2]
  def change
    create_table :replies do |t|
      t.text :description
      t.string :image

      t.timestamps
    end
  end
end
