class Move
  attr_reader :id, :name, :type
  @@count = 0
  def initialize(move_params)
    @id = @@count += 1
    @name = move_params[:name]
    @type = move_params[:type]
  end
end

class Trainer
  attr_reader :moves
  def initialize(moves)
    @moves = moves
  end

  def disp_moves
    puts "わざ一覧 "
    @moves.each do |move|
      puts "#{move.id}.#{move.name} (#{move.type}タイプ)"
    end
  end

  def select_move
    while true
      print "わざの番号を選択 > "
      select_move_num = gets.to_i
      break if (1..2).include?(select_move_num)
      puts "1~2の番号から選んでください。"
    end
    moves[select_move_num - 1]
  end
end

# 技データ
move_params = [
    {name: "ひっかく", type: "ノーマル"},
    {name: "ひのこ", type: "ほのお"}
]

# 技インスタンス生成
moves = []
move_params.each do |param|
  moves << Move.new(param)
end

# 技インスタンス生成
trainer = Trainer.new(moves)
trainer.disp_moves