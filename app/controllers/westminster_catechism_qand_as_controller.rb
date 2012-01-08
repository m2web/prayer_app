class WestminsterCatechismQandAsController < ApplicationController
  # GET /westminster_catechism_qand_as
  # GET /westminster_catechism_qand_as.json
  def index
    @westminster_catechism_qand_as = WestminsterCatechismQandA.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @westminster_catechism_qand_as }
    end
  end

  # GET /westminster_catechism_qand_as/1
  # GET /westminster_catechism_qand_as/1.json
  def show
    @westminster_catechism_qand_a = WestminsterCatechismQandA.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @westminster_catechism_qand_a }
    end
  end

  # GET /westminster_catechism_qand_as/new
  # GET /westminster_catechism_qand_as/new.json
  def new
    @westminster_catechism_qand_a = WestminsterCatechismQandA.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @westminster_catechism_qand_a }
    end
  end

  # GET /westminster_catechism_qand_as/1/edit
  def edit
    @westminster_catechism_qand_a = WestminsterCatechismQandA.find(params[:id])
  end

  # POST /westminster_catechism_qand_as
  # POST /westminster_catechism_qand_as.json
  def create
    @westminster_catechism_qand_a = WestminsterCatechismQandA.new(params[:westminster_catechism_qand_a])

    respond_to do |format|
      if @westminster_catechism_qand_a.save
        format.html { redirect_to @westminster_catechism_qand_a, notice: 'Westminster catechism qand a was successfully created.' }
        format.json { render json: @westminster_catechism_qand_a, status: :created, location: @westminster_catechism_qand_a }
      else
        format.html { render action: "new" }
        format.json { render json: @westminster_catechism_qand_a.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /westminster_catechism_qand_as/1
  # PUT /westminster_catechism_qand_as/1.json
  def update
    @westminster_catechism_qand_a = WestminsterCatechismQandA.find(params[:id])

    respond_to do |format|
      if @westminster_catechism_qand_a.update_attributes(params[:westminster_catechism_qand_a])
        format.html { redirect_to @westminster_catechism_qand_a, notice: 'Westminster catechism qand a was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @westminster_catechism_qand_a.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /westminster_catechism_qand_as/1
  # DELETE /westminster_catechism_qand_as/1.json
  def destroy
    @westminster_catechism_qand_a = WestminsterCatechismQandA.find(params[:id])
    @westminster_catechism_qand_a.destroy

    respond_to do |format|
      format.html { redirect_to westminster_catechism_qand_as_url }
      format.json { head :ok }
    end
  end
end
