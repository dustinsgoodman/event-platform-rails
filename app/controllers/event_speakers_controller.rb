# frozen_string_literal: true

class EventSpeakersController < AdminController
  before_action :set_event_speaker, only: %i[show edit update destroy]

  # GET /event/:event_id/speakers
  def index
    @event_speakers = Event.find(params[:event_id]).event_speakers
  end

  # GET /event_speakers/1 or /event_speakers/1.json
  def show; end

  # GET /event_speakers/new
  def new
    @event_speaker = EventSpeaker.new
  end

  # GET /event_speakers/1/edit
  def edit; end

  # POST /event_speakers or /event_speakers.json
  def create
    @event_speaker = EventSpeaker.new(event_speaker_params)

    respond_to do |format|
      if @event_speaker.save
        format.html { redirect_to event_speaker_url(@event_speaker), notice: t('EventSpeaker.created') }
        format.json { render :show, status: :created, location: @event_speaker }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event_speaker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_speakers/1 or /event_speakers/1.json
  def update
    respond_to do |format|
      if @event_speaker.update(event_speaker_params)
        format.html { redirect_to event_speaker_url(@event_speaker), notice: t('EventSpeaker.updated') }
        format.json { render :show, status: :ok, location: @event_speaker }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event_speaker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_speakers/1 or /event_speakers/1.json
  def destroy
    @event_speaker.destroy!

    respond_to do |format|
      format.html { redirect_to event_speakers_url, notice: t('EventSpeaker.destroyed') }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event_speaker
    @event_speaker = EventSpeaker.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def event_speaker_params
    params.require(:event_speaker).permit(:first_name, :last_name, :job_title, :company, :profile_picture, :bio,
                                          :date_of_birth, :language, :ip_address)
  end
end
