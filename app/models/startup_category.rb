class StartupCategory < ActiveRecord::Base
  has_and_belongs_to_many :startups

  validates :name, uniqueness: true, presence: true

  # Before a category is destroyed, make sure that entries in association tables are removed.
  before_destroy do
    startups.clear
  end
end
