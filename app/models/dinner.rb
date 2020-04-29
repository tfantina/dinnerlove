class Dinner < ApplicationRecord
    validates :name, uniqueness: true, presence: true

    belongs_to :user
    has_one_attached :photo
    has_many :meals
    has_many :meal_plans, through: :meals
    has_many :loves
    has_many :dinner_tags
    has_many :tags, through: :dinner_tags


    # before_save :crop_image
    #
    # def crop_image
    #   filename = photo.filename.to_s
    #   puts attachment_path = "#{Dir.tmpdir}/#{photo.filename}"
    #
    #
    #   image = MiniMagick::Image.open(attachment_path)
    #   image.resize "500x500"
    #   image.write attachment_path
    # end
end
