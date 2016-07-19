class Feedback
  include ActiveModel::Validations

  ATTRIBUTES = %i(name email body)

  attr_accessor(*ATTRIBUTES)

  validates(*ATTRIBUTES, presence: true)
end
