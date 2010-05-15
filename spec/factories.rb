Factory.define :post do |p|
  p.title           "Just another blog post"
  p.sequence(:slug) { |n| "post-#{n}" }
  p.published_at    Time.now
  p.content         "Post content"
end