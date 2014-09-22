class AddUserTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :number_of_hacks
      t.string :school
      t.string :shirt_size
      t.string :major
      t.string :diet
      t.string :interests
    end
  end
end
