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
    @vote = Vote.where(:link_id => params[:vote][:link_id], :user_id => current_user.id).first
      if @vote
        @vote.up = params[:vote][:up]
        @vote.save
      else
        @vote = current_user.votes.create(params[:vote])
      end
    redirect_to :back
    # @vote = current_user.votes.create(params[:vote])
    # # Only current_user will be allowed to make comments under their own account
    # # current_user.comments tells Rails that the foreign key in comments will have
    # # to point at current_user's primary key
    # puts "==================="
    # puts @vote.errors.inspect
    # redirect_to :back
  end

end
