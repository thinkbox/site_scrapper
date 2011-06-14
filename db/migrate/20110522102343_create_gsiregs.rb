class CreateGsiregs < ActiveRecord::Migration
  def self.up
    create_table :gsiregs do |t|
      t.string :gsingo_id
      t.string :type
      t.string :docurl
      t.string :num

      t.timestamps
    end
  end

  def self.down
    drop_table :gsiregs
  end
end
