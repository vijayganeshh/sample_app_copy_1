class Poll < ActiveRecord::Base
  has_many :votes, dependent: :destroy
  has_many :voters, through: :votes, class_name: "User", foreign_key: "user_id"
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true

  def vote(answer)
    increment(answer == 'Yes' ? :yes : :no)
  end

  def vote_options
    @vote_options = ["Yes", "No"]
  end

  def normalized_votes_for(option)
    votes_summary == 0 ? 0 : (vote_option_count(option).to_f / votes_summary) * 100
  end

  def vote_option_count(option)
 	option == "Yes" ? (yes.present? ? yes : 0) : (no.present? ?  no : 0)
 end

  def votes_summary
    votes.count.present? ? votes.count : 0
  end

  def deleted?
    deleted_at.present?
  end
end
