class CreateGsingos < ActiveRecord::Migration
  def self.up
    create_table :gsingos do |t|
      t.string :sourceurl
      t.string :gsi_id
      t.string :ngo_name
      t.string :contact_addressline
      t.string :contact_city
      t.string :contact_district
      t.string :contact_state
      t.string :contact_pin
      t.string :pc_id
      t.string :contact_phone1
      t.string :contact_phone2
      t.string :contact_emailid
      t.string :contact_weburl
      t.string :startingyear
      t.string :fulltimestaff
      t.string :fulltimevol
      t.boolean :iscrediblealliance
      t.string :reg_as
      t.string :reg_in_state

      t.timestamps
    end
  end

  def self.down
    drop_table :gsingos
  end
end
