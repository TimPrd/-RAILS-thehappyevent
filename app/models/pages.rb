def self.search(search)
  where("address LIKE ?", "%#{search}%")
  where("ville LIKE ?", "%#{search}%")
  where("datee LIKE ?", "%#{search}%")
end