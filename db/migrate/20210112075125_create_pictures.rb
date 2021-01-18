class CreatePictures < ActiveRecord::Migration[6.0]
  def change
    create_table :pictures do |t|
      t.integer    :genre_id,  null: false
      t.string     :title,     null: false
      t.text       :text,      null: false
      t.references :user,      foreign_key: true
      t.timestamps
    end
  end
end
