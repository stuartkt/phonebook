class ContactPolicy
  attr_reader :user, :contact

  def initialize(user, contact)
    @user = user
    @contact = contact
  end

  def show?
    contact.phonebook.user == user
  end

  def update?
    contact.phonebook.user == user
  end

  def destroy?
    contact.phonebook.user == user
  end

  def create?
    contact.phonebook.user == user
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.joins(:phonebook).where(phonebook: { user_id: user.id })
    end
  end
end
