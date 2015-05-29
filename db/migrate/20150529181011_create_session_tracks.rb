class CreateSessionTracks < ActiveRecord::Migration
  def change
    create_table :session_tracks do |t|
      t.references :track, index: true, foreign_key: true
      t.references :session, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
