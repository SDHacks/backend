class CreateResumes < ActiveRecord::Migration
  def change
    remove_column :hackers, :resume
    create_table :resumes do |t|
      t.belongs_to :hacker
      t.binary :resume, limit: 600.kilobytes
      t.timestamps
    end
  end
end
