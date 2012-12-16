class Comment < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :up, :user_id, :link_id

  belongs_to :link
  belongs_to :user

end
