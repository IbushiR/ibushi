class TweetsController < BaseController

  def index
    @tweets = Tweet.order(created_at: :desc).page(params[:page]).per(5)
    @tweets = @tweets.search(params[:keyword]) if params[:keyword].present?
  end

  def new
    @tweet = current_user.tweets.build
  end

  def create
    @tweet = current_user.tweets.build(tweet_params)
    if @tweet.save
      redirect_to user_url(current_user)
    else
      render :new, status: :unprocessble_entity
    end    
  end

  def show
    @tweet = Tweet.find(params[:id])
    @comments = @tweet.comments.order(created_at: :desc).page(params[:page]).per(5)
  end

  def search
    @tweets = Tweet.search(params[:keyword]).order(created_at: :desc).page(params[:page]).per(5)
    @keyword = params[:keyword]
    render "search"
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content)
  end

end
