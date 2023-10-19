class AttemptsController < ApplicationController
  before_action :set_attempt, only: %i[ show edit update ]
  before_action :set_wordle

  def set_wordle
    @wordle = Wordle.find(params[:wordle_id])
  end

  # GET /attempts or /attempts.json
  def index
    @attempts = @wordle.attempts
  end

  # GET /attempts/1 or /attempts/1.json
  def show
  end

  # GET /attempts/new
  def new
    @attempt = @wordle.attempts.new
  end

  # GET /attempts/1/edit
  def edit
  end

  # POST /attempts or /attempts.json
  def create
    @attempt = @wordle.attempts.new(attempt_params)

    respond_to do |format|
      if @attempt.save
        format.html { redirect_to wordle_attempt_url(@wordle, @attempt), notice: "Attempt was successfully created." }
        format.json { render :show, status: :created, location: @attempt }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @attempt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attempts/1 or /attempts/1.json
  def update
    respond_to do |format|
      if @attempt.update(attempt_params)
        format.html { redirect_to wordle_attempt_url(@wordle, @attempt), notice: "Attempt was successfully updated." }
        format.json { render :show, status: :ok, location: @attempt }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @attempt.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attempt
      @attempt = Attempt.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def attempt_params
      params.require(:attempt).permit(:wordle_id, :answer)
    end
end
