class TopicCell < Cell::Rails
  def hot
    @topics = Topic.includes(:group).all.sample(6)

    render
  end
end