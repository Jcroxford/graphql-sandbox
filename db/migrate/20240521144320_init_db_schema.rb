class InitDbSchema < ActiveRecord::Migration[6.1]
  def up
    create_table :genres do |t|
      t.string :name, null: false
      t.timestamps
    end

    create_table :authors do |t|
      t.string :name, null: false
      t.references :genre, foreign_key: true, null: false
      t.timestamps
    end

    create_table :books do |t|
      t.string :title, null: false
      t.string :rating
      t.references :author, foreign_key: true, null: false
      t.references :genre, foreign_key: true, null: false
      t.timestamps
    end
  end

  def down
    drop_table :books if table_exists? :books
    drop_table :authors if table_exists? :authors
    drop_table :genres if table_exists? :genres
  end
end
