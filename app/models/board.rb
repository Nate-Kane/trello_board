class Board < ApplicationRecord
  belongs_to :user
  has_many :lists, dependent: :destroy

  def self.single_board(user_id, board_id)
    Board.find_by_sql(["
      SELECT * 
      FROM boards AS b
      WHERE b.id = ? AND b.user_id = ?
    ", board_id, user_id]).first
  end
end
