class RemoveTamplateIdFromCaptchas < ActiveRecord::Migration
  def change
    remove_column :captchas, :template_id
  end
end
