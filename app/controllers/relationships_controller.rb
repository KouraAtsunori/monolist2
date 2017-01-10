class RelationshipsController < ApplicationController
  before_action :logged_in_user

  def create
    @user = User.find(params[:followed_id])
    current_user.follow(@user)
  end

  def destroy
    #20170109 メンタリング修正ｓ
    @relation = Relationship.find(params[:id])
    @user = User.find(@relation.followed_id)
    current_user.unfollow(@user)
#    relationship = current_user.following_relationships.find(params[:id])

  end
end