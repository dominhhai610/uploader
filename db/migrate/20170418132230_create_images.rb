class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :title
      t.attachment :image
      t.references :user

      t.timestamps
    end
  end
end
