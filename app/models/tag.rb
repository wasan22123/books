class Tag < ApplicationRecord
    validates :name, presence: true
    has_many :book_tag_relations, dependent: :destroy
    has_many :books, through: :book_tag_relations, dependent: :destroy
end
