class User < ApplicationRecord
  scope :advocates, -> { where(role_name: 'advocate') }
  scope :clients, -> { where(role_name: 'client') }
end
