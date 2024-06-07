# frozen_string_literal: true

class EventSessionsController < AdminController
  before_action :set_event_session, only: %i[show edit update destroy]

  # GET /events/:event_id/sessions
  def index
    @event_sessions = Event.find(params[:event_id]).event_sessions
  end

  # GET /events/:event_id/sessions/1 or /events/:event_id/sessions/1.json
  def show
    authorize @event_session
  rescue Pundit::NotAuthorizedError
    not_found
  end

  # GET /events/:event_id/sessions/new
  def new
    authorize Event.find(params[:event_id]), policy_class: EventPolicy
    @event_session = EventSession.new
  rescue Pundit::NotAuthorizedError
    not_found
  end

  # GET /events/:event_id/sessions/1/edit
  def edit
    authorize @event_session
  rescue Pundit::NotAuthorizedError
    not_found
  end

  # POST /event_sessions or /event_sessions.json
  def create
    authorize Event.find(params[:event_id]), policy_class: EventPolicy
    @event_session = EventSession.new(event_session_params)
    @event_session.event_id = params[:event_id]

    respond_to do |format|
      if @event_session.save
        format.html { redirect_to event_session_url(event_id: @event_session.event_id, id: @event_session.id), notice: t('EventSession.created') }
        format.json { render :show, status: :created, location: @event_session }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event_session.errors, status: :unprocessable_entity }
      end
    end
  rescue Pundit::NotAuthorizedError
    not_found
  end

  # PATCH/PUT /events/:event_id/sessions/1 or /events/:event_id/sessions/1.json
  def update
    authorize @event_session

    respond_to do |format|
      if @event_session.update(event_session_params)
        format.html { redirect_to event_session_url(event_id: @event_session.event_id, id: @event_session.id), notice: t('EventSession.updated') }
        format.json { render :show, status: :ok, location: @event_session }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event_session.errors, status: :unprocessable_entity }
      end
    end
  rescue Pundit::NotAuthorizedError
    not_found
  end

  # DELETE /events/:event_id/sessions/1 or /events/:event_id/sessions/1.json
  def destroy
    authorize @event_session
    @event_session.destroy!

    respond_to do |format|
      format.html { redirect_to event_sessions_url, notice: t('EventSession.destroyed') }
      format.json { head :no_content }
    end
  rescue Pundit::NotAuthorizedError
    not_found
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
