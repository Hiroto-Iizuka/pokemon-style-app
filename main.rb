require_relative './lib/pokemon'
require_relative './lib/move'

require_relative './lib/enemy'
require_relative './lib/enemy_move'




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
pokemon.register_move(move_params)
pokemon.disp_moves
pokemon.select_move
pokemon.move_name
pokemon.attack(enemy)

enemy.register_move(enemy_move_params)
enemy.select_move
enemy.move_name