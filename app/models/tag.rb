class Tag < ApplicationRecord
  has_and_belongs_to_many :questions
  validates :body, presence: true
  # + проверка уникальности на уровне базы
  validates :body, uniqueness: true
end
