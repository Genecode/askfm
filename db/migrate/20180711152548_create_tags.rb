class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :body
      t.timestamps
    end
    add_index :tags, :body, unique: true
  end
end
