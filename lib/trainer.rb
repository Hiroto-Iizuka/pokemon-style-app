class Trainer
  attr_reader :selected_move
  # 技の選択
  def select_move(moves)
    while true
      print "わざの番号を選択 > "
      select_move_num = gets.to_i
      @selected_move = moves.find{|move| move.id == select_move_num}
      break if !@selected_move.nil?
      puts "#{moves.first.id}から#{moves.last.id}の番号から選んでください。"
    end
    moves[select_move_num - 1]
  end
end