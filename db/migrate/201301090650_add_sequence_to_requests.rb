class AddSequenceToRequests < ActiveRecord::Migration
def up
    #add sequence to 
    execute <<-SQL
	ALTER TABLE requests ALTER COLUMN id SET DEFAULT nextval('requests_id_seq'::regclass);
    SQL
  end
 
  def down
	execute <<-SQL
		ALTER TABLE requests ALTER COLUMN id SET NOT NULL;
	SQL
  end
end
