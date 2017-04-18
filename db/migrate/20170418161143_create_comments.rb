class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :content
      t.references :user
      t.references :image

      t.timestamps
    end
  end
end
