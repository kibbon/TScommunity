class ProjectionsController < ApplicationController
  before_action :set_projection, only: [:show, :edit, :update, :destroy]
  respond_to :json, :html
  # GET /projections
  # GET /projections.json
  def index
	if params[:commit]=="Search"
		if params[:q]
			search_rgx = params[:q]
			@projections = Projection.where("title LIKE ?", "%#{search_rgx}%")
			@projections = @projections.order("updated_at desc")
		else
			@projections = []
		end
	else 
		if params[:commit]=="Stars"
			@relations = Relation.where(:person_id => current_person.id)
			if !(@relations.empty?)
				@projections = Projection.where(:id => @relations[0].projection_id)
				@relations.each do |relation|
					@projections = @projections|Projection.where(:id => relation.projection_id)
				end
				@projections = (@projections.sort_by{|u| u.updated_at}).reverse! 
			else
				@projections = []
			end
		else 
			@projections = Projection.all
			@projections = @projections.order("updated_at desc")
		end
	end
  end

  # GET /projections/1
  # GET /projections/1.json
  def show
  end

  # GET /projections/new
  def new
    @projection = Projection.new
  end

  # GET /projections/1/edit
  def edit
  end

  # POST /projections
  # POST /projections.json
  def create
    @projection = Projection.new(projection_params)
	@projection.user_num = 0
    respond_to do |format|
      if @projection.save
        format.html { redirect_to @projection, notice: 'Projection was successfully created.' }
        format.json { render :show, status: :created, location: @projection }
      else
        format.html { render :new }
        format.json { render json: @projection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projections/1
  # PATCH/PUT /projections/1.json
  def update
    respond_to do |format|
      if @projection.update(projection_params)
        format.html { redirect_to @projection, notice: 'Projection was successfully updated.' }
        format.json { render :show, status: :ok, location: @projection }
      else
        format.html { render :edit }
        format.json { render json: @projection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projections/1
  # DELETE /projections/1.json
  def destroy
    @projection.destroy
    respond_to do |format|
      format.html { redirect_to projections_url, notice: 'Projection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_projection
      @projection = Projection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def projection_params
      params.require(:projection).permit(:title, :info, :user_num)
    end
end
