class RelationsController < ApplicationController
  before_action :set_relation, only: [:show, :edit, :update, :destroy]

  # GET /relations
  # GET /relations.json
  def index
	# @relations = Relation.where("person_id = ?",current_person.id)
    @relations = Relation.all
  end

  # GET /relations/1
  # GET /relations/1.json
  def show
  end

  # GET /relations/new
  def new
    @relation = Relation.new
	respond_to do |format|
      format.html
      format.xml  { render :xml => @relation }
    end
  end

  # GET /relations/1/edit
  def edit
  end

  # POST /relations
  # POST /relations.json
  def create
	@projection = Projection.find(params[:projection_id])
    @relation = Relation.new
	@relation.projection = @projection
	@relation.person = current_person
    respond_to do |format|
      if @relation.save
		@projection.user_num += 1
		@projection.updated_at = @relation.created_at
		@projection.save
        format.html { redirect_to @projection, notice: 'Concerning projection!' }
        format.json { render :show, status: :created, location: @relation }
      else
        format.html { render "projections/show" }
        format.json { render json: @relation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /relations/1
  # PATCH/PUT /relations/1.json
  def update
    respond_to do |format|
      if @relation.update(relation_params)
        format.html { redirect_to @relation, notice: 'Relation was successfully updated.' }
        format.json { render :show, status: :ok, location: @relation }
      else
        format.html { render :edit }
        format.json { render json: @relation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /relations/1
  # DELETE /relations/1.json
  def destroy
	@projection = Projection.find(params[:projection_id])
    @relation.destroy
	 respond_to do |format|
	  if @projection.user_num > 0
		@projection.user_num -= 1
		@projection.save
	  end
      format.html { redirect_to @projection, notice: 'Cancel concerning' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_relation
      @relation = Relation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def relation_params
      params.require(:relation).permit(:projection_id, :person_id)
    end
end
