class Feedback
  include ActiveModel::Validations

  ATTRIBUTES = %i(name email body)

  attr_reader(*ATTRIBUTES)

  validates(*ATTRIBUTES, presence: true)

  def initialize(opts = {})
    @name  = opts[:name]
    @email = opts[:email]
    @body  = opts[:body]
  end
end
