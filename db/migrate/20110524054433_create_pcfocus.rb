class CreatePcfocus < ActiveRecord::Migration
  def self.up
    create_table :pcfocus do |t|
      t.string :pcngo_id
      t.string :typestr
      t.string :val

      t.timestamps
    end
  end

  def self.down
    drop_table :pcfocus
  end
end
