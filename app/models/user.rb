class ImageNameUniquenessValidator < ActiveModel::Validator
  def validate(record)
    record.errors.add(:image, :uniqueness) if uniqueness?(record)
  end

  private

  def uniqueness?(record)
    User.find_by_image(record.image.identifier)
  end
end

class User < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  validates_with ImageNameUniquenessValidator
end
