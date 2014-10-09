class AddResumeToHackers < ActiveRecord::Migration
  def change
    add_column :hackers, :resume, :binary, limit: 600.kilobytes
  end
end
