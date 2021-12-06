class ChangeReferenceToRanks < ActiveRecord::Migration[6.0]
  def up
    remove_reference :ranks, :user
    add_reference :ranks, :user, null: false, index: { unique: true }, foreign_key: { on_delete: :restrict, on_update: :restrict }, comment: 'ユーザー'
  end

  def down
    remove_reference :ranks, :user
    add_reference :ranks, :user, null: false, index: { unique: true }, foreign_key: { on_delete: :cascade, on_update: :cascade }, comment: 'ユーザー'
  end
end
