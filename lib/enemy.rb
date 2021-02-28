class Enemy
  attr_reader :name, :type, :offense, :defense, :enemymoves
  attr_accessor :hp
  # 初期ステータス
  def initialize(**params)
    @name = params[:name]
    @type = params[:type]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
    @enemymoves = []
  end

  # 技を登録
  def register_move(enemy_move_params)
    enemy_move_params.each do |param|
      @enemymoves << EnemyMove.new(param)
    end
  end

  # 自動で技の選択
  def select_move
    select_move_num = rand(1..2)
    @selected_move = enemymoves.find { |move| move.id == select_move_num }
    enemymoves[select_move_num - 1]
  end

  def move_name
    puts "#{@name}の#{@selected_move.name}!!"
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