class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.datetime :publish_time
      t.string :link
      t.string :header_img
      t.timestamps
    end
  end
end
