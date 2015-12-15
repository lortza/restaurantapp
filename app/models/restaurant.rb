class Restaurant < ActiveRecord::Base
  has_many :dishes, dependent: :destroy
  has_many :outings, dependent: :destroy
  has_many :categorizations, dependent: :destroy
  has_many :categories, through: :categorizations

  PRICES = ["Low", "Average", "Above Average", "Expensive"]
  validates :price, inclusion: { in: PRICES }

  STATES = ['AL', 'AK', 'AZ', 'AR', 'CA', 'CO', 'CT', 'DE', 'FL', 'GA', 'HI', 'ID', 'IL', 'IN', 'IA', 'KS', 'KY', 'LA', 'ME', 'MD', 'MA', 'MI', 'MN', 'MS', 'MO', 'MT', 'NE', 'NV', 'NH', 'NJ', 'NM', 'NY', 'NC', 'ND', 'OH', 'OK', 'OR', 'PA', 'RI', 'SC', 'SD', 'TN', 'TX', 'UT', 'VT', 'VA', 'WA', 'WV', 'WI', 'WY']
  validates :state, inclusion: { in: STATES }
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
#  fave            :boolean
#  archive         :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
