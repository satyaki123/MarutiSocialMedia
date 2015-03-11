module DashboardHelper
  def post(post)
    post_type = post.type
    puts "post type is #{post_type} for #{post}"
    case post_type
    when "photo"
      post_details = post.link
      likes_count = post.likes.count
      comments_count = post.comments.count
    when "status"
      post_details = post.story
      likes_count = post.likes.count
      comments_count = 0
    else
    post_details = 0
    likes_count = 0
    comments_count = 0
    end
    [post_type,post_details,likes_count,comments_count]
  end

  def favorite(tweet_id)
   obj1=$client.status(tweet_id)
   obj1.favorite_count
end
def retweets(tweet_id)
   obj2=$client.status(tweet_id)
   obj2.retweet_count
end
def follower_details(follower)
   [follower.id,follower.screen_name]
end

end

