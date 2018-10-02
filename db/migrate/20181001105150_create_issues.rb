class CreateIssues < ActiveRecord::Migration[5.0]
  def change
    create_table :issues do |t|
      t.string :description
      t.string :state

      t.timestamps
    end
  end
end
