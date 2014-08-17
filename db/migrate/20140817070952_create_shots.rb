class CreateShots < ActiveRecord::Migration
  def change
    create_table :shots do |t|
      t.references :user, index: true
      t.string :url
      t.string :image

      t.timestamps
    end
  end
end
