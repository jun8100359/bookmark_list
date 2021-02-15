class CreateBookmarks < ActiveRecord::Migration[6.0]
  def change
    create_table :bookmarks do |t|
      t.string :title, null: false
      t.string :bookmark_url
      t.text :text
      t.references :user, foreign_key: true
      t.references :list, foreign_key: true
      t.timestamps
    end
  end
end
