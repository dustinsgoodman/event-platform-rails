# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  # TODO: Make all published items visible to everyone
  def show?
    platform_organization_access?
  end

  def create?
    platform_organization_access?
  end

  def new?
    create?
  end

  def update?
    platform_organization_access?
  end

  def edit?
    update?
  end

  def destroy?
    platform_organization_access?
  end

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      raise NoMethodError, "You must define #resolve in #{self.class}"
    end

    private

    attr_reader :user, :scope
  end

  private

  def platform_organization_access?
    user.platform_organization_access?(record_org_id)
  end

  def record_org_id
    raise NoMethodError, "You must define #record_org_id in #{self.class}"
  end
end
