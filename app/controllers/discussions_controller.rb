class DiscussionsController < ApplicationController
  before_action :set_discussion, only: [:show, :edit, :update, :destroy]

  # GET /discussions
  # GET /discussions.json
  def index
    @discussions = Discussion.all
  end

  # GET /discussions/1
  # GET /discussions/1.json
  def show
  end

  # GET /discussions/new
  def new
    @discussion = Discussion.new
	respond_to do |format|
      format.html
      format.xml  { render :xml => @discussion }
    end
  end

  # GET /discussions/1/edit
  def edit
	@projection = Projection.find(params[:projection_id])
  end

  # POST /discussions
  # POST /discussions.json
  def create
	@projection = Projection.find(params[:projection_id])
    @discussion = Discussion.new(discussion_params)
	@discussion.projection = @projection
	@discussion.person = current_person
    respond_to do |format|
      if @discussion.save
		@projection.updated_at = @discussion.created_at
		@projection.save
        format.html { redirect_to @projection, notice: 'Discussion was successfully created.' }
        format.json { render :show, status: :created, location: @discussion }
      else
        format.html { render "projections/show"}
        format.json { render json: @discussion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /discussions/1
  # PATCH/PUT /discussions/1.json
  def update
	@projection = Projection.find(params[:projection_id])
    respond_to do |format|
      if @discussion.update(discussion_params)
        format.html { redirect_to @projection, notice: 'Discussion was successfully updated.' }
        format.json { render :show, status: :ok, location: @discussion }
      else
        format.html { render "projections/show" }
        format.json { render json: @discussion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discussions/1
  # DELETE /discussions/1.json
  def destroy
	@projection = Projection.find(params[:projection_id])
    @discussion.destroy
    respond_to do |format|
      format.html { redirect_to @projection, notice: 'Discussion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discussion
      @discussion = Discussion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def discussion_params
      params.require(:discussion).permit(:content, :projection_id, :person_id)
    end
end
