class List < ApplicationRecord
  belongs_to :board

  def self.single_list(board_id, list_id)
    List.find_by_sql(["
      SELECT * 
      FROM lists AS l
      WHERE l.id = ? AND l.board_id = ?
    ", list_id, board_id]).first
  end
end
