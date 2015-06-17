class ReviewDecorator < Draper::Decorator
  delegate_all

  def author
    return "#{user.firstname} #{user.lastname}".rstrip
  end

end
