class CreateAnimalAreas < ActiveRecord::Migration
  def change
    create_table :animal_areas do |t|
      t.string :forward_sorting_area
      t.integer :dogs
      t.integer :cats
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
