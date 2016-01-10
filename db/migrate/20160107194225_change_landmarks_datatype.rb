class ChangeLandmarksDatatype < ActiveRecord::Migration
  def change
    change_column(:landmarks, :year_completed, :integer )
  end
end
