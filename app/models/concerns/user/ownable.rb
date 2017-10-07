module User::Ownable
  extend ActiveSupport::Concern

  def ownable? object
    case object
    when FacebookPage
      object.user_id == id
    else
      false
    end
  end
end
