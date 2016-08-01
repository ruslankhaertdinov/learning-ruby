class Feedback
  include ActiveModel::Validations

  ATTRIBUTES = %i(name email body).freeze
  EMAIL_FORMAT = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  attr_reader(*ATTRIBUTES)

  validates(*ATTRIBUTES, presence: true)
  validates :email, format: { with: EMAIL_FORMAT }

  def initialize(opts = {})
    @name  = opts[:name]
    @email = opts[:email]
    @body  = opts[:body]
  end
end
