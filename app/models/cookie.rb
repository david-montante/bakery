class Cookie < ActiveRecord::Base
  belongs_to :storage, polymorphic: :true
  
  validates :storage, presence: true

  def ready?
    (Time.current - self.created_at) / 1.minutes > 2
  end
end
