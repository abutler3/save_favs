class Vote < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :message, :user_id, :link_id, :up

  belongs_to :user
  belongs_to :link

  validates :user_id, :uniqueness => { :scope => :link_id }
  # Essentially what we are telling our vote model is that it
  # cannot save any new votes unless the user_id and link_id
  # combo haven't been taken created before. If we were going to
  # leave the scope part out then it would verify that all user_id
  # rows in our vote table are unique which would prevent users
  # from voting on anything more than once...ever. Since we don't
  # want that we only want to prevent users from voting on one link
  # over and over again.

  Vote.find_each {|vote| vote.destroy unless vote.valid? }
  # we have new validation code in place we might already have some
  # bad entries that have duplicate user_id and link_id saved to the
  # database. You can get rid of these by iterating through all the
  # votes in your system and deleting them if they are invalid. You
  # can use the find_each method to get all votes (this uses batched
  # find so you will not run out of memory even on a huge number of
  # votes). This method takes a block that will be yielded to for
  # each vote

end
