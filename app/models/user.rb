class ImageNameUniquenessValidator < ActiveModel::Validator
  def validate(record)
    error_message = 'Image name is not uniqueness'
    record.errors[:base] << error_message if uniqueness?(record)
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
