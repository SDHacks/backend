class AddAuthentificationTokenToHacker < ActiveRecord::Migration
  def change
    add_column :hackers, :authentication_token, :string
    add_index :hackers, :authentication_token, unique: true
  end
end
