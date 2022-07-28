class AddCategoryReferenceToEntries < ActiveRecord::Migration[5.2]
  def change
    add_reference :entries, :category
  end
end
