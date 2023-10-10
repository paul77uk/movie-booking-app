class MoviesController < ApplicationController
  # before_action :set_movie, only: %i[ show edit update destroy ]

  # GET /movies or /movies.json
  def index
#     url = "https://api.themoviedb.org/3/movie/popular?language=en-US&page=1&api_key=2ff30619736c2a86478e6e5912f3e98e"
#     serialized = URI.open(url).read
#     data = JSON.parse(serialized)

#     @movies = data['results']

# # puts "#{user["name"]} - #{user["bio"]}"
    @movies = Movie.all
  end

  # GET /movies/1 or /movies/1.json
  def show
  end

  # GET /movies/new
  def new
    @movies = Favourite.all
  end

  # GET /movies/1/edit
  def edit
  end

  def favorite


    movies = Movie.all

    movies.each do |movie|
      @new_movie = Favourite.new(title: movie.title, poster_path: movie.poster_path, overview: movie.overview) if movie.id == params[:id].to_i && Favourite.find_by(poster_path: movie.poster_path) == nil
    end

    if @new_movie && @new_movie.save
      redirect_to new_movie_path
    else
      flash.now[:notice] = 'movies already exists in favourites'
    end

    Movie.all.uniq

    # movie = movie.first

    # Movie.create(title: movie['title'], poster_path: movie['poster_path'], overview: movie['overview'])
  end

  # POST /movies or /movies.json
  def create
    movie = @movies.select do |movie|
      movie['id'] == params[:id]
    end

    movie = movie.first
    Movie.create(title: movie['title'], poster_path: movie['poster_path'], overview: movie['overview'])
    # @movie = Movie.new(movie_params)

    # respond_to do |format|
    #   if @movie.save
    #     format.html { redirect_to movie_url(@movie), notice: "Movie was successfully created." }
    #     format.json { render :show, status: :created, location: @movie }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @movie.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /movies/1 or /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to movie_url(@movie), notice: "Movie was successfully updated." }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1 or /movies/1.json
  def destroy
    @movie.destroy

    respond_to do |format|
      format.html { redirect_to movies_url, notice: "Movie was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_movie
    #   @movie = Movie.find(params[:id])
    # end

    # Only allow a list of trusted parameters through.
    def movie_params
      params.require(:movie).permit(:id, :title, :poster_path, :overview)
    end
end
