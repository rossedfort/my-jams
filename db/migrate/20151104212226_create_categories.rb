class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.references :song, index: true, foreign_key: true
    end
  end
end
