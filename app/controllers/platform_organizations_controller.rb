# frozen_string_literal: true

class PlatformOrganizationsController < ApplicationController
  before_action :set_platform_organization, only: %i[show edit update destroy]

  # GET /platform_organizations or /platform_organizations.json
  def index
    @platform_organizations = PlatformOrganization.all
  end

  # GET /platform_organizations/1 or /platform_organizations/1.json
  def show; end

  # GET /platform_organizations/new
  def new
    @platform_organization = PlatformOrganization.new
  end

  # GET /platform_organizations/1/edit
  def edit; end

  # POST /platform_organizations or /platform_organizations.json
  def create
    @platform_organization = PlatformOrganization.new(platform_organization_params)

    respond_to do |format|
      if @platform_organization.save
        format.html { redirect_to platform_organization_url(@platform_organization), notice: t('PlatformOrganization.created') }
        format.json { render :show, status: :created, location: @platform_organization }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @platform_organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /platform_organizations/1 or /platform_organizations/1.json
  def update
    respond_to do |format|
      if @platform_organization.update(platform_organization_params)
        format.html { redirect_to platform_organization_url(@platform_organization), notice: t('PlatformOrganization.updated') }
        format.json { render :show, status: :ok, location: @platform_organization }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @platform_organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /platform_organizations/1 or /platform_organizations/1.json
  def destroy
    @platform_organization.destroy!

    respond_to do |format|
      format.html { redirect_to platform_organizations_url, notice: t('PlatformOrganization.destroyed') }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_platform_organization
    @platform_organization = PlatformOrganization.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def platform_organization_params
    params.require(:platform_organization).permit(:name)
  end
end
