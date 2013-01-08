class AddSequenceToCategories < ActiveRecord::Migration
def up
    #add sequence to 
    execute <<-SQL
	ALTER TABLE categories ALTER COLUMN id SET DEFAULT nextval('categories_id_seq'::regclass);
    SQL
  end
 
  def down
	execute <<-SQL
		ALTER TABLE categories ALTER COLUMN id SET NOT NULL;
	SQL
  end
end
