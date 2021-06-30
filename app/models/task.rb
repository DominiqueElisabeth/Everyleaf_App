class Task < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true , length: { in: 1..200 }

  	scope :name_search, -> (query) {where("name LIKE ?", "%#{query}%")}
  	def task_name_search(query)
  	  where("name LIKE ?", "%#{query}%")
  	end

  	scope :status_search, -> (query) {where(status: query)}
  	def status_search(query)
  	  where(status: query)
  	end

  	scope :priority_ordered, -> {order("
  	    CASE tasks.priority
  	    WHEN 'high' THEN 'a'
  	    WHEN 'medium' THEN 'b'
  	    WHEN 'low' THEN 'c'
  	    ELSE 'z'
  	    END ASC,
  	    id DESC" )}
  	max_paginates_per 5
  end