class FixTracksColumnName < ActiveRecord::Migration
  def change
    rename_column :tracks, :name, :track_name
  end
end
