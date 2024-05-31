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
    org_access?
  end

  def create?
    org_access?
  end

  def new?
    create?
  end

  def update?
    org_access?
  end

  def edit?
    update?
  end

  def destroy?
    org_access?
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

  def org_access?
    user.org_access?(record_org_id)
  end

  def record_org_id
    raise NoMethodError, "You must define #record_org_id in #{self.class}"
  end
end
