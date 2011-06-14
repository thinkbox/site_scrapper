class CreateGsifocus < ActiveRecord::Migration
  def self.up
    create_table :gsifocus do |t|
      t.string :gsingo_id
      t.string :type
      t.string :value

      t.timestamps
    end
  end

  def self.down
    drop_table :gsifocus
  end
end
