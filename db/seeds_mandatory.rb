puts 'creating admin users...'
AdminUser.create(
  email: 'admin@gart360.com',
  password: 'password',
  password_confirmation: 'password'
)

p 'creating default tags...'
['画家', '雕塑', '手工艺', '摄影'].each do |tag|
  DefaultTag.create(name: tag)
end

puts 'creating categories'
categories = {
  '书法' => ['楷书', '隶书', '行书', '草书', '篆书', '其他'],
  '国画' => ['山水', '花鸟', '人物', '走兽', '其他'],
  '油画' => ['动物', '风景', '人物', '花卉', '风俗', '静物', '抽象', '设计', '其他' ],
  '混合材料' => ['丙烯', '水粉', '水彩', '漆画', '其他'],
  '版画' => ['木刻', '石刻', '丝网刻', '金属刻', '其他'],
  '瓷器' => ['景德镇窑', '汝窑', '官窑', '哥窑', '定窑', '钧窑', '耀州窑', '磁州窑', '洪州窑', '长沙窑', '越窑',  '龙泉窑', '吉州窑', '建窑'],
  '雕塑' => ['木雕', '石雕', '玉雕', '玻璃雕塑', '金属雕塑', '玻璃钢雕塑', '其他'],
  '其他' => ['原创', '仿品']
}

categories.each do |key, arr|
  category = Category.create(name: key)
  arr.each{ |name| category.children.create(name: name) }
end

puts 'creating users'
(1..20).each do |i|
  user = User.create(email: "test#{i}@gart360.com", password: 'password', username: "gart360_user_#{i}", mobile_phone: "18#{i}21#{i}8#{i}")
  user.confirm!
end

p 'creating relationships for users...'
User.all.each do |u|
  users = User.all

  (users - [u]).sample(8).each do |target|
    u.follow!(target)
  end
end

# Rake::Task['region:download'].invoke
Rake::Task['region:import'].invoke




p 'creating groups...'

[ '陶瓷鉴赏交流', '艺术品交流中心', '油画天空', '故宫博物馆', '马年元素', '漫画者的天堂', '手工艺品收藏' ].each_with_index do |n, i|
  group = Group.new(name: n, description: "这里是#{n}的简介")
  group.logo = "http://gart360-dev.qiniudn.com/#{i+1}.jpg"
  group.user = User.all[i]
  group.is_agreed = true
  group.save!
end

p 'creating galleries...'
Gallery.create(name: '我的陶瓷鉴赏', content: '我很爱吃蘑菇~~超级爱啊~几乎蘑菇都爱', user: User.all.sample)
Gallery.create(name: '我的艺术品收藏', content: '我很爱吃蘑菇~~超级爱啊~几乎蘑菇都爱', user: User.all.sample)
Gallery.create(name: '我的油画廊', content: '我很爱吃蘑菇~~超级爱啊~几乎蘑菇都爱', user: User.all.sample)
Gallery.create(name: '我的故宫收藏', content: '我很爱吃蘑菇~~超级爱啊~几乎蘑菇都爱', user: User.all.sample)
Gallery.create(name: '我的马年元素', content: '我很爱吃蘑菇~~超级爱啊~几乎蘑菇都爱', user: User.all.sample)
Gallery.create(name: '我的漫画', content: '我很爱吃蘑菇~~超级爱啊~几乎蘑菇都爱', user: User.all.sample)
Gallery.create(name: '我的手工艺廊', content: '我很爱吃蘑菇~~超级爱啊~几乎蘑菇都爱', user: User.all.sample)
Gallery.create(name: '我的摄影展', content: '我很爱吃蘑菇~~超级爱啊~几乎蘑菇都爱', user: User.all.sample)
Gallery.create(name: '我的雕塑展', content: '我很爱吃蘑菇~~超级爱啊~几乎蘑菇都爱', user: User.all.sample)

Gallery.all.sample(3).each do |gallery|
  gallery.mark_as_featured!
end

p 'creating artworks...'
Gallery.all.each do |gallery|
  5.times do |i|
    artwork = gallery.artworks.new
    artwork.name = "#{gallery.name}的作品集#{i+1}"
    artwork.content = artwork.name
    artwork.user = gallery.user
    artwork.save

    image_ids = (1..8).to_a.sample(5)
    images = image_ids.map { |x| "http://gart360-dev.qiniudn.com/#{x}.jpg" }

    images.each do |image|
      artwork.images.create(img: image)
    end
  end
end

p 'marking featured artworks....'
Artwork.all.sample(10).each do |artwork|
  artwork.mark_as_featured!
end

p 'creating pending events...'
Gallery.all.each_with_index do |gallery, index|
  user = gallery.user

  event = user.events.new(start_at: (3..8).to_a.sample.days.since, end_at: (10..20).to_a.sample.days.since)
  event.subject = "我的马元素发布会#{index+1}"
  event.description = event.subject
  event.save

  gallery.artworks.each do |artwork|
    images = artwork.images

    2.times do |i|
      event.event_images.create(image_id: images[0].id)
    end
  end
end

p 'creating active events...'
Gallery.all.each_with_index do |gallery, index|
  user = gallery.user

  event = user.events.new(start_at: (1..4).to_a.sample.days.ago, end_at: (10..20).to_a.sample.days.since)
  event.subject = "正在进行中的我的马元素发布会#{index+1}"
  event.description = event.subject
  event.save

  gallery.artworks.each do |artwork|
    images = artwork.images
    
    2.times do |i|
      event.event_images.create(image_id: images[0].id)
    end
  end
end

p 'creating active events...'
Gallery.all.each_with_index do |gallery, index|
  user = gallery.user

  event = user.events.new(start_at: (10..20).to_a.sample.days.ago, end_at: (1..8).to_a.sample.days.ago)
  event.subject = "已关闭的我的马元素发布会#{index+1}"
  event.description = event.subject
  event.save

  gallery.artworks.each do |artwork|
    images = artwork.images
    
    2.times do |i|
      event.event_images.create(image_id: images[0].id)
    end
  end
end


p 'creating topics and replies...'
user = User.first
group = Group.first
topic_body = '我很爱吃蘑菇~~超级爱啊~几乎蘑菇都爱！从小也都听大人们还有老师说，毒蘑菇不能吃，越漂亮的越有毒。我想到一句网络名句：你负责赚钱养家,我负责貌美如花。毒蘑菇说道：你负责饱食大家，我负责貌美如花。'
[ '需要经典电影论坛邀请码的请进。。。', '无码', '桥牌天下' ].each do |t|
  group.topics.create(user_id: group.user.id, title: t, body: topic_body )
end
topic = Topic.first
topic.replies.create body: '我们是害虫！专门吃庄稼。', user_id: User.last.id
topic.replies.create body: '我们是害虫！专门吃庄稼。', user_id: User.first.id, quote_id: Reply.first.id

p 'create ads...'
ad_images = ["http://gart360-dev.qiniudn.com/banner1.png", "http://gart360-dev.qiniudn.com/banner2.jpeg"]

Ad.create(area: :auction_slider, position: 1, title: '测试广告而已', body: 'xxx', image: ad_images[0], url: 'http://www.gart360.com')
Ad.create(area: :auction_slider, position: 1, title: '测试广告而已', body: 'xxx', image: ad_images[1], url: 'http://www.gart360.com')


p 'create pending auctions...'
5.times do
  auction = Auction.new(title: "马元素专场", start_at: (2..5).to_a.sample.days.since, end_at: (10..15).to_a.sample.days.since)
  auction.banner = 'http://gart360-dev.qiniudn.com/banner1.png'
  auction.state = :pending
  auction.save
end

p 'creating active auctions...'
5.times do
  auction = Auction.new(title: "马元素专场", start_at: (-3..-1).to_a.sample.days.since, end_at: (10..15).to_a.sample.days.since)
  auction.banner = 'http://gart360-dev.qiniudn.com/banner1.png'
  auction.state = :active
  auction.save
end

p 'creating closed auctions...'
5.times do
  auction = Auction.new(title: "马元素专场", start_at: (-10..-5).to_a.sample.days.since, end_at: (-3..-1).to_a.sample.days.since)
  auction.banner = 'http://gart360-dev.qiniudn.com/banner1.png'
  auction.state = :closed
  auction.save
end

p 'create different kinds of products'
user_ids = User.all.map(&:id)
auction_ids = Auction.all.map(&:id)

Auction.all.each do |auction|
  8.times do |i|
    product = auction.products.new(title: "马元素商品#{i}", user_id: user_ids.sample, base_price: 0.1, per_price: 0.1)
    product.type_identifier = :auction
    product.build_detail(body: "商品#{i} 是个不错的商品, 非常好")
    product.save

    image_ids = (1..8).to_a.sample(5)
    images = image_ids.map { |x| "http://gart360-dev.qiniudn.com/#{x}.jpg" }

    5.times do |i|
      product.photos.create(data: images[i], position: i+1)
    end
  end
end

10.times do |i|
  product = Product.new(title: "马元素商品#{i+40}", user_id: user_ids.sample, base_price: 0.1, per_price: 0.1)
  product.start_at = (i-2).days.since
  product.end_at = (i+2).days.since
  product.type_identifier = :zero
  product.build_detail(body: "商品#{i+40} 是个不错的商品, 非常好")
  product.save

  image_ids = (1..8).to_a.sample(5)
  images = image_ids.map { |x| "http://gart360-dev.qiniudn.com/#{x}.jpg" }

  5.times do |i|
    product.photos.create(data: images[i], position: i+1)
  end
end

10.times do |i|
  product = Product.new(title: "马元素商品#{i+60}", user_id: user_ids.sample, base_price: 0.1, per_price: 0.1)
  product.start_at = (i-2).days.since
  product.end_at = (i+2).days.since
  product.type_identifier = :charity
  product.build_detail(body: "商品#{i+60} 是个不错的商品, 非常好")
  product.save

  image_ids = (1..8).to_a.sample(5)
  images = image_ids.map { |x| "http://gart360-dev.qiniudn.com/#{x}.jpg" }

  5.times do |i|
    product.photos.create(data: images[i], position: i+1)
  end
end


# wiki categories
['艺术之乡', '名人名家', '工具材料', '百科导航'].each do |name|
  WikiCategory.create(name: name)
end

# episodes
['艺术家', '风尚', '精品推荐', '活动', '非遗展示', '合作伙伴'].each do |title|
  Episode.create(title: title, body: '待修改')
end

# collection items
['商品1', '商品2'].each do |item|
  collcetion_item = CollectionItem.new(name: item, user_id: User.all.sample.id, description: '待添加啊')
  3.times{ collcetion_item.photos.new(data: 'http://gart360-dev.qiniudn.com/common/7d59dcee-e748-4750-8655-8f0c6b16e21a.jpg') }
  collcetion_item.save!
end
  