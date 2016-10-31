class Listing < ApplicationRecord

  belongs_to :tool
  validates :name, presence: true
  validates :notes, length: {in: 1..250}
  # belongs_to :lender, :class_name => "User"

  def self.search(search)
     sql = <<-SQL
      SELECT * FROM listings
      WHERE UPPER(listings.name)
      LIKE UPPER('%#{search}%')
      SQL
    self.find_by_sql(sql)
  end

  def tool_name
    Tool.find(self.tool_id).name
  end

  def find_tool_lender_id
    Tool.find(self.tool_id).lender_id
  end

  def user_owns_listing?
    session[:user_id] == self.find_tool_lender_id
  end

end
