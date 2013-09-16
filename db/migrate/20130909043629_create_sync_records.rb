class CreateSyncRecords < ActiveRecord::Migration
  def change
    create_table :sync_records do |t|
      t.string :files_present, array: true, default: []
      t.string :posts_present, array: true, default: []

      t.timestamps
    end
  end
end
