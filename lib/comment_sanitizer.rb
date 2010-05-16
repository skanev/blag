module CommentSanitizer
  SANITIZE_CONFIG = {
    :protocols => {
      "a" => {"href" => ["ftp", "http", "https", "mailto", :relative]},
      "blockquote" => {"cite" => ["http", "https", :relative]},
      "q" => {"cite" => ["http", "https", :relative]},
    },
    :elements => %w[a blockquote cite code dd dl dt em li ol pre q strike strong ul],
    :attributes => {
      "a" => ["href"],
      "blockquote" => ["cite"],
      "pre" => ["lang"],
      "q" => ["cite"],
    },
    :add_attributes => {"a" => {"rel" => "nofollow"}},
    :output => :html,
  }
  
  def clean(content)
    Sanitize.clean(content, SANITIZE_CONFIG) unless content.nil?
  end

  extend self
end