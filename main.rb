class Pokemon
  attr_reader :name, :type, :offense, :defense
  attr_accessor :hp
  # 初期ステータス
  def initialize(**params)
    @name = params[:name]
    @type = params[:type]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
  end

  def move_name(selected_move)
    puts "#{@name}の#{selected_move.name}!!"
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

class Enemy
  attr_reader :name, :type, :offense, :defense
  attr_accessor :hp
  # 初期ステータス
  def initialize(**params)
    @name = params[:name]
    @type = params[:type]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
  end

  def move_name(selected_move)
    puts "#{@name}の#{selected_move.name}!!"
  end

  # 攻撃
  def attack(pokemon)

    attack_num = rand(9)

    if attack_num == 0
      puts "急所にあたった！"
      damage = calculate_critical_hit - pokemon.defense
    else
      damage = @offense - pokemon.defense
    end
    pokemon.hp -= damage

    puts "#{pokemon.name}は#{damage}のダメージを受けた"
    puts "#{pokemon.name}の残りHPは#{pokemon.hp}だ"
  end

  def calculate_critical_hit
    @offense * 1.5
  end

end

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


class EnemyMove
  attr_reader :id, :name, :type
  @@count = 0
  def initialize(enemy_move_params)
    @id = @@count += 1
    @name = enemy_move_params[:name]
    @type = enemy_move_params[:type]
  end
end

class EnemyAction
  attr_reader :enemymoves, :selected_move
  def initialize(enemy_move_params)
    @enemymoves = []
    register_move(enemy_move_params)
  end

  # 技を登録
  def register_move(enemy_move_params)
    enemy_move_params.each do |param|
      @enemymoves << EnemyMove.new(param)
    end
  end

  # 自動で技の選択
  def select_move(enemymoves)
    select_move_num = rand(1..2)
    @selected_move = enemymoves.find{|move| move.id == select_move_num}
    enemymoves[select_move_num - 1]
  end
end


# ポケモンインスタンス生成
pokemon = Pokemon.new(name: "ヒトカゲ", type: "ほのお", hp: 300, offense: 100, defense: 50)
enemy = Enemy.new(name: "ゼニガメ", type: "みず", hp: 400, offense: 70, defense: 80)

# 技データ
move_params = [
    {name: "ひっかく", type: "ノーマル"},
    {name: "ひのこ", type: "ほのお"}
]

# 敵の技データ
enemy_move_params = [
  {name: "たいあたり", type: "ノーマル"},
  {name: "みずでっぽう", type: "みず"}
]

# 技インスタンス生成
trainer = Trainer.new(move_params)
trainer.disp_moves
trainer.select_move(trainer.moves)
pokemon.move_name(trainer.selected_move)
pokemon.attack(enemy)

enemyaction = EnemyAction.new(enemy_move_params)
enemyaction.select_move(enemyaction.enemymoves)
enemy.move_name(enemyaction.selected_move)
enemy.attack(pokemon)