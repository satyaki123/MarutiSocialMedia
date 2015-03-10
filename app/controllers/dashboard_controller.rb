class DashboardController < ApplicationController
  layout 'dashboard'
  @@page = FbGraph::Page.fetch('249343554283',:access_token => "661208107330805|5IrEoXCReFDFSxeB1j9Zju_XNOI")
  def index
    @total_likes = @@page.raw_attributes[:likes]
    @@page_id = @@page.identifier
    @@page_link = @@page.raw_attributes[:link]
    @post_count = @@page.posts.count
    @talking_about = @@page.raw_attributes[:talking_about_count]
  end

  def fb_posts
    @posts = @@page.posts
  end

  def likes
    post_identifier =  params[:postidentifier]
    posts = @@page.posts
    posts.each do |i|
      if i.identifier == post_identifier
        puts i.identifier
        puts post_identifier
        @liked_post = i
        @likes = @liked_post.likes
      end
    end

  end

  def comments
    @@page = FbGraph::Page.fetch('249343554283',:access_token => "661208107330805|5IrEoXCReFDFSxeB1j9Zju_XNOI")
    post_identifier =  params[:postidentifier]
    posts = @@page.posts
    posts.each do |i|
      if i.identifier == post_identifier
        puts i.identifier
        puts post_identifier
        @commented_post = i
        @comments = @commented_post.comments
      end
    end
  end

  def collect_with_max_id(collection=[], max_id=nil, &block)
  response = yield(max_id)
  collection += response
  response.empty? ? collection.flatten : collect_with_max_id(collection, response.last.id - 1, &block)
end
  
  def $client.get_all_tweets(user)
  collect_with_max_id do |max_id|
    options = {count: 200, include_rts: true}
    options[:max_id] = max_id unless max_id.nil?
    user_timeline(user, options)
  end
 end

def tweet_details
  @count=$client.get_all_tweets("Reliance_MF").count
  @twitterhandle=("@Reliance_MF")
end
def tweet_text
  @ids=$client.get_all_tweets("Reliance_MF").take(10)
  
end


  
end


