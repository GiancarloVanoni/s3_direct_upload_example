class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :profile_image_url

      t.timestamps null: false
    end
  end
end
