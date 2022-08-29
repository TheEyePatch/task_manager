class Work::Regular < Work
  belongs_to :output
  validates :output_id, uniqueness: true
end