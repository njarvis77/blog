class PostPolicy < ApplicationPolicy

  def create?
    user.has_role? :admin or user.has_role? :moderator
  end

  def destroy?
    binding.pry
    user.has_role? :admin or (user.has_role? :moderator and record.user_id == user.id)
  end

end
