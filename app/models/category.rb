class Category < ActiveRecord::Base

  has_many :categorizations, dependent: :destroy
  has_many :restaurants, through: :categorizations

  before_validation :generate_slug

  validates :name, presence: true, uniqueness: true
  validates :slug, uniqueness: true

  def generate_slug
    self.slug ||= name.parameterize if name
  end #generate_slug

  def to_param
    slug
  end #to_param

end #Category

# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string
#
