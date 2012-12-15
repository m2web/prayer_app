class JmVersesController < ApplicationController
  # GET /jm_verses
  # GET /jm_verses.json
  def index
    @jm_verses = JmVerse.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @jm_verses }
    end
  end

  # GET /jm_verses/1
  # GET /jm_verses/1.json
  def show
    @jm_verse = JmVerse.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @jm_verse }
    end
  end

  # GET /jm_verses/new
  # GET /jm_verses/new.json
  def new
    @jm_verse = JmVerse.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @jm_verse }
    end
  end

  # GET /jm_verses/1/edit
  def edit
    @jm_verse = JmVerse.find(params[:id])
  end

  # POST /jm_verses
  # POST /jm_verses.json
  def create
    @jm_verse = JmVerse.new(params[:jm_verse])

    respond_to do |format|
      if @jm_verse.save
        format.html { redirect_to @jm_verse, notice: 'Jm verse was successfully created.' }
        format.json { render json: @jm_verse, status: :created, location: @jm_verse }
      else
        format.html { render action: "new" }
        format.json { render json: @jm_verse.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /jm_verses/1
  # PUT /jm_verses/1.json
  def update
    @jm_verse = JmVerse.find(params[:id])

    respond_to do |format|
      if @jm_verse.update_attributes(params[:jm_verse])
        format.html { redirect_to @jm_verse, notice: 'Jm verse was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @jm_verse.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jm_verses/1
  # DELETE /jm_verses/1.json
  def destroy
    @jm_verse = JmVerse.find(params[:id])
    @jm_verse.destroy

    respond_to do |format|
      format.html { redirect_to jm_verses_url }
      format.json { head :ok }
    end
  end
end
