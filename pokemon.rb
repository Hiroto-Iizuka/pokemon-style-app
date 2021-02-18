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