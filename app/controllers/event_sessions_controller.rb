# frozen_string_literal: true

class EventSessionsController < AdminController
  before_action :set_event_session, only: %i[show edit update destroy]

  # GET /event/:event_id/sessions
  def index
    @event_sessions = Event.find(params[:event_id]).event_sessions
  end

  # GET /event_sessions/1 or /event_sessions/1.json
  def show; end

  # GET /event_sessions/new
  def new
    @event_session = EventSession.new
  end

  # GET /event_sessions/1/edit
  def edit; end

  # POST /event_sessions or /event_sessions.json
  def create
    @event_session = EventSession.new(event_session_params)

    respond_to do |format|
      if @event_session.save
        format.html { redirect_to event_session_url(@event_session), notice: t('EventSession.created') }
        format.json { render :show, status: :created, location: @event_session }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_sessions/1 or /event_sessions/1.json
  def update
    respond_to do |format|
      if @event_session.update(event_session_params)
        format.html { redirect_to event_session_url(@event_session), notice: t('EventSession.updated') }
        format.json { render :show, status: :ok, location: @event_session }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_sessions/1 or /event_sessions/1.json
  def destroy
    @event_session.destroy!

    respond_to do |format|
      format.html { redirect_to event_sessions_url, notice: t('EventSession.destroyed') }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event_session
    @event_session = EventSession.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def event_session_params
    params.require(:event_session).permit(:name, :description, :start_at, :end_at, :capcity)
  end
end
