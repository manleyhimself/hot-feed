class FeedsController < ApplicationController
  before_action :set_feed, only: [ :show, :edit, :update, :destroy]

  # GET /feeds
  # GET /feeds.json
  def index
    @feed = Feed.where(id: 1).first_or_create
    if @feed.links.length == 0 || ((Time.now - @feed.links.first.updated_at) >= 2700)
      Scraper.new.assign_links_to_feed(@feed)
    end 
    if !session[:hot_list] || session[:hot_list].length == 0
      session[:hot_list] = @feed.links.shuffle
    end
  end

  def entertainment
    @feed = Feed.where(id: 2).first_or_create
    if @feed.links.length == 0 || ((Time.now - @feed.links.first.updated_at) >= 2700)
      Scraper.new.assign_links_to_feed(@feed)
    end 
    if !session[:entertain_list] || session[:entertain_list].length == 0
      session[:entertain_list] = @feed.links.shuffle
    end
  end

  def animal
    @feed = Feed.where(id: 3).first_or_create
    if @feed.links.length == 0 || ((Time.now - @feed.links.first.updated_at) >= 2700)
      Scraper.new.assign_links_to_feed(@feed)
    end 
    if !session[:animal_list] || session[:animal_list].length == 0
      session[:animal_list] = @feed.links.shuffle
    end
  end

  def diy
    @feed = Feed.where(id: 4).first_or_create
    if @feed.links.length == 0 || ((Time.now - @feed.links.first.updated_at) >= 2700)
      Scraper.new.assign_links_to_feed(@feed)
    end 
    if !session[:diy_list] || session[:diy_list].length == 0
      session[:diy_list] = @feed.links.shuffle
    end
  end

  def rewind
    @feed = Feed.where(id: 5).first_or_create
    if @feed.links.length == 0 || ((Time.now - @feed.links.first.updated_at) >= 2700)
      Scraper.new.assign_links_to_feed(@feed)
    end 
    if !session[:rewind_list] || session[:rewind_list].length == 0
      session[:rewind_list] = @feed.links.shuffle
    end
  end

  def politics
    @feed = Feed.where(id: 6).first_or_create
    if @feed.links.length == 0 || ((Time.now - @feed.links.first.updated_at) >= 2700)
      Scraper.new.assign_links_to_feed(@feed)
    end 
    if !session[:politics_list] || session[:politics_list].length == 0
      session[:politics_list] = @feed.links.shuffle
    end
  end

  # GET /feeds/1
  # GET /feeds/1.json
  def show
  end

  # GET /feeds/new
  def new
    @feed = Feed.new
  end

  # GET /feeds/1/edit
  def edit
  end

  # POST /feeds
  # POST /feeds.json
  def create
    @feed = Feed.new(feed_params)

    respond_to do |format|
      if @feed.save
        format.html { redirect_to @feed, notice: 'Feed was successfully created.' }
        format.json { render action: 'show', status: :created, location: @feed }
      else
        format.html { render action: 'new' }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /feeds/1
  # PATCH/PUT /feeds/1.json
  def update
    respond_to do |format|
      if @feed.update(feed_params)
        format.html { redirect_to @feed, notice: 'Feed was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feeds/1
  # DELETE /feeds/1.json
  def destroy
    @feed.destroy
    respond_to do |format|
      format.html { redirect_to feeds_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feed
      @feed = Feed.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feed_params
      params[:feed]
    end
end
