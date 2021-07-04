class Task < ApplicationRecord
  belongs_to :user
  # validates :user_id, presence: true

  validates :name, presence: true
  validates :description, presence: true , length: { in: 1..200 }

  	scope :name_search, -> (query) {where("name LIKE ?", "%#{query}%")}
  	def name_search(query)
  	  where("name LIKE ?", "%#{query}%")
  	end

  	scope :status_search, -> (query) {where(status: query)}
  	def status_search(query)
  	  where(status: query)
  	end
    scope :user_task_list, -> (query) {where(user_id: query)}
    def user_task_list(query)
      where(user_id: query)
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
