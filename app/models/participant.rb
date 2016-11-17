class Participant < ApplicationRecord

  validates :userId,     :uniqueness      => { :scope => :evenementId }



end
