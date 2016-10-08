class VideosController < ApplicationController
  def index
      @videos = Video.all
   end

   def new
      @video = Video.new
   end

   def create
      @video = Video.new(videos_params)
      if @video.save
         redirect_to videos_path, notice: "The video #{@video.name} has been uploaded."
      else
         render "new"
      end
   end

   def destroy
      @video = Video.find(params[:id])
      @video.destroy
      redirect_to videos_path, notice: "The videoFile #{@video.name} has been deleted."
   end

   private
      def videos_params
      params.require(:video).permit(:name, :attachment)
   end                                                                                                                                                          
end
