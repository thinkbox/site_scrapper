class CreatePcngos < ActiveRecord::Migration
  def self.up
    create_table :pcngos do |t|
      t.string :sourceurl
      t.string :ngo_name
      t.string :ngo_uid
      t.string :ngo_chieffunk
      t.string :ngo_chair
      t.string :ngo_sec
      t.string :ngo_trea
      t.string :ngo_promo1
      t.string :ngo_promo2
      t.string :ngo_parent
      t.string :reg_with
      t.string :reg_type
      t.string :reg_no
      t.string :reg_date
      t.string :reg_city
      t.string :reg_fcra
      t.string :reg_doc_link
      t.string :focus_issues
      t.string :focus_states
      t.string :focus_district
      t.string :contact_address
      t.string :contact_city
      t.string :contact_state
      t.string :contact_tel
      t.string :contact_mobile
      t.string :contact_email
      t.string :contact_website
      t.string :contact_fax

      t.timestamps
    end
  end

  def self.down
    drop_table :pcngos
  end
end
