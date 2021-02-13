class Pokemon
  attr_reader :name, :type, :hp, :offense, :defense
  # 初期ステータス
  def initialize
    @name = name
    @type = type
    @hp = hp
    @offense = offense
    @defense = defense
  end
end

# ポケモンインスタンス生成
pokemon = Pokemon.new(name: "ヒトカゲ", type: "ほのお", hp: 300, offense: 100, defense: 50)
