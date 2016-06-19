class PollsController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user,   only: :destroy

  def show
    if logged_in?
      @user = User.find(params[:id])
      @poll = current_user.polls.build
      @polls = @user.polls.paginate(page: params[:page])
    end
  end

  def create
    @poll = current_user.polls.build(poll_params)
    if @poll.save
      flash[:success] = "poll created!"
    end
    redirect_to poll_path(current_user)
    #   redirect_to polls_path(@user)
    # else
    #   @polls_feed_items = []
    #   render 'static_pages/home'
    # end
  end

  # vote action
  def vote
    if current_user && params[:poll] && params[:poll][:id] && params[:vote_option] && params[:vote_option][:id]
      @poll = Poll.find_by_id(params[:poll][:id])
      @answer = params[:vote_option][:id]
      if @answer && @poll && !current_user.voted_for?(@poll) && !@poll.deleted?
        @poll.vote(@answer)
        @poll.votes.create({user_id: current_user.id})
        @poll.save
      else
        render js: 'alert(\'Your vote cannot be saved. Have you already voted?\');'
      end
    else
      render js: 'alert(\'Your vote cannot be saved.\');'
    end
  end

  def participate
    if logged_in?
      @poll = current_user.polls.build
      @polls_feed_items = current_user.polls_feed.paginate(page: params[:page])
    end
  end

  def destroy
    @poll.update_attributes(deleted_at: DateTime.current)
  end

  private

    def poll_params
      params.require(:poll).permit(:topic, :yes, :no)
    end

    def correct_user
      @poll = current_user.polls.find_by(id: params[:id])
      redirect_to root_url if @poll.nil?
    end
end