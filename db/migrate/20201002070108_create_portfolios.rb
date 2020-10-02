class CreatePortfolios < ActiveRecord::Migration[6.0]
  def change
    create_table :portfolios do |t|
      t.string :title,    null: false
      t.string :url,      null: false
      t.string :language, null: false
      t.text :text,       null: false
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
