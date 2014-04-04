class Users::AccountStatementsController < ApplicationController
  layout 'weitou'
  before_filter :authenticate_user!
  sec_nav_highlight :account

  before_filter :hide_subheader

  def index
    @account_statements = current_user.account_statements.page(params[:page])
  end

end
