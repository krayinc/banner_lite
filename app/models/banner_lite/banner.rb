module BannerLite
  class Banner < ActiveRecord::Base
    validates :url, presence: true
    scope :active, ->{ now = Time.zone.now; where(arel_table[:active_from].lteq(now).and(arel_table[:active_until].gt(now))) }
  end
end
