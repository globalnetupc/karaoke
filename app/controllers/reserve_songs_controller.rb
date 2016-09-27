class ReserveSongsController < ApplicationController
  before_action :set_reserve_song, only: [:show, :edit, :update, :destroy]

  # GET /reserve_songs
  # GET /reserve_songs.json
  def index
    @reserve_songs = ReserveSong.all
  end

  # GET /reserve_songs/1
  # GET /reserve_songs/1.json
  def show
  end

  # GET /reserve_songs/new
  def new
    @reserve_song = ReserveSong.new
  end

  # GET /reserve_songs/1/edit
  def edit
  end

  # POST /reserve_songs
  # POST /reserve_songs.json
  def create
    @reserve_song = ReserveSong.new(reserve_song_params)

    respond_to do |format|
      if @reserve_song.save
        format.html { redirect_to @reserve_song, notice: 'Reserve song was successfully created.' }
        format.json { render :show, status: :created, location: @reserve_song }
      else
        format.html { render :new }
        format.json { render json: @reserve_song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reserve_songs/1
  # PATCH/PUT /reserve_songs/1.json
  def update
    respond_to do |format|
      if @reserve_song.update(reserve_song_params)
        format.html { redirect_to @reserve_song, notice: 'Reserve song was successfully updated.' }
        format.json { render :show, status: :ok, location: @reserve_song }
      else
        format.html { render :edit }
        format.json { render json: @reserve_song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reserve_songs/1
  # DELETE /reserve_songs/1.json
  def destroy
    @reserve_song.destroy
    respond_to do |format|
      format.html { redirect_to reserve_songs_url, notice: 'Reserve song was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reserve_song
      @reserve_song = ReserveSong.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reserve_song_params
      params.require(:reserve_song).permit(:reserver_id, :box_id, :song_id, :create_time, :state, :description, :rate_stage, :local_video)
    end
end
