class AddLongitudeToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :longitude, :string
  end
end
