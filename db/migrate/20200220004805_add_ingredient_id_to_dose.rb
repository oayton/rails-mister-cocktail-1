class AddIngredientIdToDose < ActiveRecord::Migration[5.2]
  def change
    change_table :doses do |t|
      t.references :ingredient, foreign_key: true
    end
  end
end
