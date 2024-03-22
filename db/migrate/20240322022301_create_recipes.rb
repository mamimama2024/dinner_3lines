class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :title, null: false
      t.string :item,  null: false
      t.string :url
      t.text   :step
      t.text   :note
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end