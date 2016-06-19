module PollsHelper
	def count_or_zero(value)
  		value.present? ? value : 0 
	end

	def visualize_votes_for(option, poll)
    content_tag :div, class: 'progress' do
      content_tag :div, class: 'progress-bar',
                  style: "width: #{poll.normalized_votes_for(option)}%" do
        "#{poll.vote_option_count(option)}"
      end
    end
  end
end
