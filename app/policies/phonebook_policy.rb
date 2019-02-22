class PhonebookPolicy
  attr_reader :user, :phonebook

  def initialize(user, phonebook)
    @user = user
    @phonebook = phonebook
  end

  def show?
    phonebook.user == user
  end
  def update?
    phonebook.user == user
  end

  def destroy?
    phonebook.user == user
  end
end
