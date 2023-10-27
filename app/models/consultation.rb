class Consultation < ApplicationRecord
    validates :link, presence: true, format: { with: URI::regexp(%w[http https]), message: 'Invalid URL' }
end
