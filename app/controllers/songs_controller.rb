class SongsController < ApplicationController
  def show
    setter
    @genre = @song.genre
    @artist = @song.artist
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params(:name, :artist_id, :genre_id))
    @song.save

    redirect_to song_path(@song)
  end

  def edit
    setter
  end

  def update
    setter
    @song.update(song_params(:name, :artist_id, :genre_id))

    redirect_to song_path(@song)
  end

  def index
    @songs = Song.all
  end

  private

  def setter
    @song = Song.find(params[:id])
  end

  def song_params(*args)
    params.require(:song).permit(*args)
  end

end
