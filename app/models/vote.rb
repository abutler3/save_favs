class Vote < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :message, :user_id, :link_id

  belongs_to :user
  belongs_to :link


end
