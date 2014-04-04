class Admin::UsersController < Admin::BaseController
  main_nav_highlight :user
  sec_nav_highlight :users

  defaults resource_class: User, collection_name: 'users', instance_name: 'user' 
  custom_actions resource: :account_statements

  def update
    resource.update_attributes(user_params)
    update!{
      collection_path
    }
  end

  def account_statements
    @account_statements = resource.account_statements.page(params[:page])
  end

  private
    def user_params
      params.require(:user).permit!
    end

    def collection
      end_of_association_chain.page(params[:page])
    end
end
