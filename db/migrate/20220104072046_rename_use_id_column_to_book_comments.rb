class RenameUseIdColumnToBookComments < ActiveRecord::Migration[5.2]
  def change
    rename_column :book_comments, :use_id, :user_id
  end
end
