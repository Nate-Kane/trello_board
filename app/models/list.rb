class List < ApplicationRecord
  belongs_to :board

  def self.single_list(user_id, list_id)
    List.find_by_sql(["
      SELECT * 
      FROM lists AS l
      WHERE l.id = ? AND l.board_id = ?
    ", list_id, user_id]).first
  end
end
# where is says WHERE l.id = ? AND l.board_id = ? is where you access the list through the board,
    # and then the user_id param is where you access current user.