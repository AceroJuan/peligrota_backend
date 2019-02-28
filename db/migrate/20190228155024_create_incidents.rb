class CreateIncidents < ActiveRecord::Migration[5.2]
  def change
    create_table :incidents do |t|
      t.float :longitude
      t.float :latitude
      t.integer :danger_level
      t.string :description,   :limit => 255 #By default SQL String limit 255 character
      #Ex:- :limit => 40
      t.datetime :datetime
      t.string :creator_name
      t.timestamps
    end
  end
end
