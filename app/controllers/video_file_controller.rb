
class VideoFileController < ApplicationController
  
   def index
      @videofile = VideoFile.all
   end

   def new
      @videofile = VideoFile.new
   end

   def create
      @videofile = VideoFile.new(video_file_params)
      if @videofile.save
         redirect_to video_file_path, notice: "The videofile #{@videofile.name} has been uploaded."
      else
         render "new"
      end
   end

   def destroy
      @videofile = VideoFile.find(params[:id])
      @videofile.destroy
      redirect_to video_file_path, notice: "The videoFile #{@videofile.name} has been deleted."
   end

   private
      def video_file_params
      params.require(:video_file).permit(:name, :attachment)
   end                                                                                                                                                          
   def video_files_params                                                                                                                                                  
      params.require(:video_file).permit(:name, :attachment)                                                                                                                 
   end         
end
