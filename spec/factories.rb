Factory.define :post do |p|
  p.title           "Just another blog post"
  p.sequence(:slug) { |n| "post-#{n}" }
  p.published_at    Time.now
  p.content         "Post content"
end

Factory.define :comment do |c|
  c.author          "Commenter"
  c.email           "commenter@example.org"
  c.url             "http://commenter.example.org"
  c.content         "Comment's content"
  c.ip              "127.0.0.1" # There is no place like it
  c.association     :post
end