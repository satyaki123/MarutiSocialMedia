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
end
