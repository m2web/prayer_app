class AddYearToJmVerses < ActiveRecord::Migration
  def change
		add_column :jm_verses, :year, :string
  end
end
