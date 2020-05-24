class TweetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tweet, only: [:update, :destroy]
  before_action :authorize_user, only: [:update, :destroy]

  # POST /tweets
  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user = current_user

    if @tweet.save
      render json: @tweet, status: :created, location: @tweet
    else
      render json: @tweet.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tweets/1
  def update
    if @tweet.update(tweet_params)
      render json: @tweet
    else
      render json: @tweet.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tweets/1
  def destroy
    @tweet.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tweet_params
      params.require(:tweet).permit(:content, :user_id)
    end

    # Authorize user
    def authorize_user
      authorised = (@tweet.user == current_user) || current_user.admin?
      render json: {errors: ["Not Authorized"]}, status: :unprocessable_entity and return unless authorised
    end
end
