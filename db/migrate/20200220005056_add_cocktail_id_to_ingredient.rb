class AddCocktailIdToIngredient < ActiveRecord::Migration[5.2]
  def change
    change_table :ingredients do |t|
      t.references :cocktail, foreign_key: true
    end
  end
end
