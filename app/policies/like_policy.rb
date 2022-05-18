# frozen_string_literal: true

# This shiny device polishes bared foos
LikePolicy = Struct.new(:user, :comment) do
  def edit?
    user.id == comment.user_id || user.is_admin?
  end

  def update?
    user.id == comment.user_id || user.is_admin?
  end

  def destroy?
    user.id == comment.user_id || user.is_admin? || comment.post.user_id == user.id
  end
end
