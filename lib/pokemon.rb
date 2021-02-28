class Pokemon
  attr_reader :name, :type, :offense, :defense, :moves
  attr_accessor :hp
  # 初期ステータス
  def initialize(**params)
    @name = params[:name]
    @type = params[:type]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
    @moves = []
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
  def select_move
    while true
      print "わざの番号を選択 > "
      select_move_num = gets.to_i
      @selected_move = @moves.find{|move| move.id == select_move_num}
      break if !@selected_move.nil?
      puts "#{@moves.first.id}から#{@moves.last.id}の番号から選んでください。"
    end
    moves[select_move_num - 1]
  end

  def move_name
    puts "#{@name}の#{@selected_move.name}!!"
  end

  # 攻撃
  def attack(enemy)
    
    attack_num = rand(9)

    if attack_num == 0
      puts "急所にあたった！"
      damage = calculate_critical_hit - enemy.defense
    else
      damage = @offense - enemy.defense
    end

    enemy.hp -= damage

    puts "#{enemy.name}は#{damage}のダメージを受けた"
    puts "#{enemy.name}の残りHPは#{enemy.hp}だ"
  end

  def calculate_critical_hit
    @offense * 1.5
  end
end