class Restaurant < ActiveRecord::Base
  belongs_to :user
  has_many :dishes, dependent: :destroy
  has_many :outings, dependent: :destroy
  has_many :categorizations, dependent: :destroy
  has_many :categories, through: :categorizations

  PRICES = ["Low", "Average", "Above Average", "Expensive"]

  validates :price, inclusion: { in: PRICES }

  STATES = ['AL', 'AK', 'AZ', 'AR', 'CA', 'CO', 'CT', 'DE', 'FL', 'GA', 'HI', 'ID', 'IL', 'IN', 'IA', 'KS', 'KY', 'LA', 'ME', 'MD', 'MA', 'MI', 'MN', 'MS', 'MO', 'MT', 'NE', 'NV', 'NH', 'NJ', 'NM', 'NY', 'NC', 'ND', 'OH', 'OK', 'OR', 'PA', 'RI', 'SC', 'SD', 'TN', 'TX', 'UT', 'VT', 'VA', 'WA', 'WV', 'WI', 'WY']
  validates :state, inclusion: { in: STATES }

  scope :fave, -> { where(fave: true) }
  scope :active, -> { where(archive: false) }
  scope :archived, -> { where(archive: true) }
  #scope :not_tried, ->(restaurant) { where(restaurant.outings.size < 1) }

  def address_secondline
    "#{city}, #{state} #{zip}" 
  end #address_secondline

  
    

    
    
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
#
# Indexes
#
#  index_restaurants_on_user_id  (user_id)
#
