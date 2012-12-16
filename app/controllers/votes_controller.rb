class VotesController < ApplicationController

  before_filter :authenticate_user!
  # Devise gives a method that runs before any other
  # methods. If redirect, user never goes to create method
  # Authenticate_user says a user must be logged in to let
  # them continue or it will go to sign in path

  def show
  end

  def new
  end

  def create
    @comment = current_user.votes.create(params[:vote])
    # Only current_user will be allowed to make comments under their own account
    # current_user.comments tells Rails that the foreign key in comments will have
    # to point at current_user's primary key
    redirect_to :back
  end

end
