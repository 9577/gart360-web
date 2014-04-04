module ActivityCommon
  extend ActiveSupport::Concern

  included do
    include PublicActivity::Model
    tracked owner: -> (controller, model) {controller && controller.current_user}, except: [:update, :destroy]
  end
end
