class Move
  attr_reader :name, :type
  def initialize(move_params)
    @name = move_params[:name]
    @type = move_params[:type]
  end
end

class Pokemon
  attr_reader :name, :type, :hp, :offense, :defense
  # 初期ステータス
  def initialize(**params)
    @name = params[:name]
    @type = params[:type]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
    @moves = moves
  end

  def disp_moves
    puts "わざを選択 > "
    @moves.each.with_index(1) do |move, i|
      puts "#{i}.#{move.name} (#{move.type}タイプ)"
    end
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
move = Move.new(moves)


# ポケモンインスタンス生成
pokemon = Pokemon.new(name: "ヒトカゲ", type: "ほのお", hp: 300, offense: 100, defense: 50)

pokemon.disp_moves
