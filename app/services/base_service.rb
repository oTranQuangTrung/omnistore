class BaseService
  attr_reader :error

  def success?
    error.nil?
  end
end
