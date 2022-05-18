# frozen_string_literal: true

# This shiny device polishes bared foos
PostPolicy = Struct.new(:user, :post) do
  def edit?
    user.id == post.user_id || user.is_admin?
  end

  def update?
    user.id == post.user_id || user.is_admin?
  end

  def destroy?
    user.id == post.user_id || user.is_admin?
  end
end
