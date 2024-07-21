class AddGeocodingToTrainingSessions < ActiveRecord::Migration[7.1]
  def change
    add_column(:training_sessions, :latitude, :float)
    add_column(:training_sessions, :longitude, :float)
  end
end
