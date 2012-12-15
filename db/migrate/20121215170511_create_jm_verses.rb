class CreateJmVerses < ActiveRecord::Migration
  def change
    create_table :jm_verses do |t|
      t.integer :verse_month
      t.string :reference
      t.text :text

      t.timestamps
    end
  end
end
