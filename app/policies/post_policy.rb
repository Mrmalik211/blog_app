class PostPolicy < Struct.new(:user, :post)


  def edit?
    user.id == post.user_id
  end

  def update?
    user.id == post.user_id
  end

  def destroy?
    user.id == post.user_id
  end
end
