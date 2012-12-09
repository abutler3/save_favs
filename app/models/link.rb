class Link < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :url, :title

  belongs_to :user

end
