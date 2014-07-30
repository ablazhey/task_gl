class Reservation < ActiveRecord::Base

  validates_presence_of :table, :start, :finish

  validate :checking_the_time, :uniqueness_reservation

  scope :tables, ->(table) { where(table: table) }

  private

  def checking_the_time
    errors.add(:finish, :checking_the_time) if start >= finish
  end

  def uniqueness_reservation
    unless Reservation.diapazone(start, finish).tables(table)
                      .where.not(id: id).empty?
      errors.add(:finish, :uniqueness_reservation)
    end
  end

  def self.diapazone(start, finish)
    where("(start >= :s AND finish <= :f) OR (start <= :s AND finish >= :s)
             OR (start <= :f AND finish >= :f)", s: start, f: finish)
  end
end
