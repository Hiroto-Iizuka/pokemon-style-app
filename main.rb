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

  def attack(enemy)
    puts "#{@name}の[技名]"
    
    attack_num = rand(9)

    if attack_num == 0
      puts "急所にあたった！"
      damage = calculate_special_attack - enemy.defense
    else
      puts "通常攻撃"
      damage = @offense - enemy.defense
    end

    enemy.hp -= damage

    puts "#{enemy.name}は#{damage}のダメージを受けた"
    puts "#{enemy.name}の残りHPは#{enemy.hp}だ"
  end

  def calculate_special_attack
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

  def attack(pokemon)
    puts "#{@name}の[技名]"

    attack_num = rand(9)

    if attack_num == 0
      puts "急所にあたった！"
      damage = calculate_special_attack - pokemon.defense
    else
      puts "通常攻撃"
      damage = @offense - pokemon.defense
    end
    pokemon.hp -= damage

    puts "#{pokemon.name}は#{damage}のダメージを受けた"
    puts "#{pokemon.name}の残りHPは#{pokemon.hp}だ"
  end

  def calculate_special_attack
    @offense * 1.5
  end

end
# ポケモンインスタンス生成
pokemon = Pokemon.new(name: "ヒトカゲ", type: "ほのお", hp: 300, offense: 100, defense: 50)
enemy = Enemy.new(name: "ゼニガメ", type: "みず", hp: 400, offense: 70, defense: 80)

pokemon.attack(enemy)
enemy.attack(pokemon)
