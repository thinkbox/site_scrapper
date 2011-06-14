class CreateCangos < ActiveRecord::Migration
  def self.up
    create_table :cangos do |t|
      t.string :sourceurl
      t.string :ca_memberid
      t.string :ngo_name
      t.string :representative
      t.string :ca_tilldate
      t.string :contact_address
      t.string :focus_district
      t.string :focus_state
      t.string :focus_region
      t.string :contact_tel
      t.string :contact_email

      t.timestamps
    end
  end

  def self.down
    drop_table :cangos
  end
end
