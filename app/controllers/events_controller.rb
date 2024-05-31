# frozen_string_literal: true

class EventsController < AdminController
  before_action :set_event, only: %i[show edit update destroy]

  # GET /events or /events.json
  def index
    orgs_ids = current_user.platform_organization_ids
    @events = Event.where(organization_id: orgs_ids)
  end

  # GET /events/1 or /events/1.json
  def show
    authorize @event
  rescue Pundit::NotAuthorizedError
    not_found
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
    authorize @event
  rescue Pundit::NotAuthorizedError
    not_found
  end

  # POST /events or /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to event_url(@event), notice: t('Event.created') }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    authorize @event

    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to event_url(@event), notice: t('Event.updated') }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  rescue Pundit::NotAuthorizedError
    not_found
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    authorize @event
    @event.destroy!

    respond_to do |format|
      format.html { redirect_to events_url, notice: t('Event.destroyed') }
      format.json { head :no_content }
    end
  rescue Pundit::NotAuthorizedError
    not_found
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(:name, :description, :timezone, :start_at, :end_at)
  end
end
