class AddSlugToGenres < ActiveRecord::Migration[5.0]
  def change
    add_column :genres, :slug, :string
  end
end
