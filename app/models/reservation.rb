class Reservation < ActiveRecord::Base
  
  validates :table, presence: true
  validates :start, presence: true
  validates :finish, presence: true

  
  validate :checking_the_time, :uniqueness_reservation

  def checking_the_time
    if start > finish || finish.to_date != start.to_date
      errors.add(:finish, "Invalid time range")
    end
  end

  def uniqueness_reservation
    unless Reservation.where("'reservations'.'table' = :t 
    	                      AND ((start >= :s AND finish <= :f) 
    	                      OR (start >= :s AND start <= :f AND finish >= :f)
    	                      OR (start <= :s AND start <= :f AND finish >= :s AND finish >= :f)
    	                      OR (start <= :s AND finish >= :s AND finish <= :f)
    	                      )",
                             {t: table, s: start, f: finish}).empty?
      errors.add(:booked_from, 'Invalid period.')
    end
  end


end
