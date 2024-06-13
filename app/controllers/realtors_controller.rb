class RealtorsController < ApiController
  before_action :set_realtor, only: %i[ show update destroy ]

  # GET /realtors
  def index
    @realtors = Realtor.all

    render json: @realtors
  end

  # GET /realtors/1
  def show
    render json: @realtor
  end

  # POST /realtors
  def create
    @realtor = Realtor.new(realtor_params)

    if @realtor.save
      render json: @realtor, status: :created, location: @realtor
    else
      render json: @realtor.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /realtors/1
  def update
    if @realtor.update(realtor_params)
      render json: @realtor
    else
      render json: @realtor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /realtors/1
  def destroy
    @realtor.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_realtor
      @realtor = Realtor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def realtor_params
      params.require(:realtor).permit(:username, :email, :rating, :contactinfo)
    end
end
