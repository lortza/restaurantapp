class Restaurant < ActiveRecord::Base
  belongs_to :user
  has_many :dishes, dependent: :destroy
  has_many :outings, dependent: :destroy
  has_many :categorizations, dependent: :destroy
  has_many :categories, through: :categorizations

  before_validation :generate_slug

  PRICES = ["$", "$$", "$$$", "$$$$"]
  validates :price, inclusion: { in: PRICES }

  STATES = ['AL', 'AK', 'AZ', 'AR', 'CA', 'CO', 'CT', 'DE', 'FL', 'GA', 'HI', 'ID', 'IL', 'IN', 'IA', 'KS', 'KY', 'LA', 'ME', 'MD', 'MA', 'MI', 'MN', 'MS', 'MO', 'MT', 'NE', 'NV', 'NH', 'NJ', 'NM', 'NY', 'NC', 'ND', 'OH', 'OK', 'OR', 'PA', 'RI', 'SC', 'SD', 'TN', 'TX', 'UT', 'VT', 'VA', 'WA', 'WV', 'WI', 'WY']
  validates :state, inclusion: { in: STATES }

  validates :name, presence: true, uniqueness: true
  validates :slug, uniqueness: true

  scope :fave, -> { where(fave: true).order("created_at DESC") }
  scope :active, -> { where(archive: false).order("created_at DESC") }
  scope :archived, -> { where(archive: true).order("created_at DESC") }
  #scope :not_tried, -> { where(untried_restaurants(current_user.restaurants)) }

  def self.been_a_while
    Restaurant.select("DISTINCT restaurants.id, restaurants.name, restaurants.street, restaurants.archive, restaurants.fave, restaurants.slug, restaurants.price, restaurants.image_file_name, restaurants.created_at").joins("JOIN outings o ON o.restaurant_id = restaurants.id").where("o.date > date(?)", 6.months.ago).order("restaurants.created_at DESC") 
  end #self.been_a_while
    

  def address_secondline
    "#{city}, #{state} #{zip}" 
  end #address_secondline

  def generate_slug
    self.slug ||= name.parameterize if name
  end #generate_slug

  def to_param
    slug
  end #to_param



end #Restaurant

# == Schema Information
#
# Table name: restaurants
#
#  id              :integer          not null, primary key
#  name            :string
#  street          :string
#  city            :string
#  state           :string
#  zip             :string
#  phone           :string
#  website         :string
#  image_file_name :string
#  price           :string
#  fave            :boolean          default(FALSE)
#  archive         :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :integer
#  slug            :string
#
# Indexes
#
#  index_restaurants_on_user_id  (user_id)
#
