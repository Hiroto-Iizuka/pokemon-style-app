class Trainer
  attr_reader :moves, :selected_move
  def initialize(move_params)
    @moves = []
    register_move(move_params)
  end

  # 技を登録
  def register_move(move_params)
    move_params.each do |param|
      @moves << Move.new(param)
    end
  end

  # 技の表示
  def disp_moves
    puts "わざ一覧 "
    @moves.each do |move|
      puts "#{move.id}.#{move.name} (#{move.type}タイプ)"
    end
  end

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