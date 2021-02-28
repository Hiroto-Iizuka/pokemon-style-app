require_relative './lib/pokemon'
require_relative './lib/move'
require_relative './lib/trainer'

require_relative './lib/enemy'
require_relative './lib/enemy_move'
require_relative './lib/enemyaction'



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