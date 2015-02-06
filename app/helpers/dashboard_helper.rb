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
      post_details = post.message
      likes_count = post.likes.count
      comments_count = nil
    else
      post_details = nil      
      likes_count = nil
      comments_count = nil
    end
    [post_type,post_details,likes_count,comments_count]
  end
    
end
