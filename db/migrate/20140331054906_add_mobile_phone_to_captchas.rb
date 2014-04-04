class AddMobilePhoneToCaptchas < ActiveRecord::Migration
  def change
    remove_column :captchas, :code
    remove_column :captchas, :status
  end
end
