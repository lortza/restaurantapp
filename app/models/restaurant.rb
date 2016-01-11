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
  validates :phone, length: { minimum: 10, allow_blank: true }
  #email: /\A\S+@\S+\z/
  #format: /\A\(?[1-9]\d{2}[\)\-]\s?\d{3}\-\d{4}\z/
  validates :website, format: { with: URI.regexp }, if: Proc.new { |a| a.website.present? }

  #validates :website, format: /\A((http|ftp|https):\/\/w{3}[\d]*.|(http|ftp|https):\/\/|w{3}[\d]*.)([\w\d\._\-#\(\)\[\]\,;:]+@[\w\d\._\-#\(\)\[\]\,;:])?([a-z0-9]+.)*[a-z\-0-9]+.([a-z]{2,3})?[a-z]{2,6}(:[0-9]+)?(\/[\/a-z0-9\._\-,]+)*[a-z0-9\-_\.\s\%]+(\?[a-z0-9=%&\.\-,#]+)?\z/
  
  validates :slug, uniqueness: true

  #before_save :format_phone
  before_save :format_website

  scope :fave, -> { where(fave: true).order("created_at DESC") }
  scope :active, -> { where(archive: false).order("created_at DESC") }
  scope :archived, -> { where(archive: true).order("created_at DESC") }
  #scope :not_tried, -> { where(untried_restaurants(current_user.restaurants)) }

  def self.been_a_while
    all_restaurants_with_visits_query = "SELECT DISTINCT restaurants.id, restaurants.name, restaurants.street, restaurants.archive, restaurants.fave, restaurants.slug, restaurants.price, restaurants.image_file_name, restaurants.created_at, (SELECT o.date FROM outings o JOIN restaurants r ON r.id = o.restaurant_id WHERE r.id = restaurants.id ORDER BY date DESC LIMIT 1) AS last_visit FROM restaurants JOIN outings o ON o.restaurant_id = restaurants.id"

    Restaurant.find_by_sql(["SELECT * FROM (#{all_restaurants_with_visits_query}) as all_rest WHERE all_rest.last_visit < date(?) ORDER BY all_rest.created_at DESC", 6.months.ago])
  end #self.been_a_while


#not working yet
  def self.not_tried 
    all_restaurants_without_visits_query = "SELECT DISTINCT restaurants.id, restaurants.name, restaurants.street, restaurants.archive, restaurants.fave, restaurants.slug, restaurants.price, restaurants.image_file_name, restaurants.created_at, (SELECT o.date FROM outings o JOIN restaurants r ON r.id = o.restaurant_id WHERE r.id = restaurants.id ORDER BY date DESC LIMIT 1) AS last_visit FROM restaurants JOIN outings o ON o.restaurant_id = restaurants.id"

    Restaurant.find_by_sql(["SELECT * FROM (#{all_restaurants_with_visits_query}) as all_rest WHERE all_rest.last_visit < date(?) ORDER BY all_rest.created_at DESC", 6.months.ago])
  end #self.been_a_while

  #unused
  def format_phone
    self.phone = phone.gsub!(/\D/, "") 
    #self.phone = phone.unpack('A3A3A4').join('-')
  end #format_phone

  def format_website_UNUSED
    if self.website.include? "https://"
      self.website = website.sub!(%r{^https://},"")
    elsif self.website.include? "http://"
      self.website = website.sub!(%r{^http://},"")
    else
    end #if
    self.website.insert(0, 'http://')
  end #format_website

  def format_website
    if self.website.present?
      if self.website.include? "https://"
        self.website = website
      elsif self.website.include? "http://"
        self.website = website
      else
        self.website.insert(0, 'http://')
      end #if
    end #present?
  end #format_website
    
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
#  notes           :string
#
# Indexes
#
#  index_restaurants_on_user_id  (user_id)
#
