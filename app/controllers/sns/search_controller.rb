class Sns::SearchController < ApplicationController
  def misc
    models = [User, Group, Topic, Gallery, Event, Artwork]
    @sunspot_search = Sunspot.search *models do |query|
      query.fulltext params[:q]
      query.paginate(:page => params[:page])
      query.with(:klass, params[:klass]) if params[:klass].present?
      query.facet(:klass)
    end
    @sunspot_search.facet(:klass).rows.each do |row|
      @users_count = row.count if row.value =='User'
    end
    @users_count ||= 0
  end
end
