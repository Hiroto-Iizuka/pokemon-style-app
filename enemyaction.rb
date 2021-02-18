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
    @selected_move = enemymoves.find { |move| move.id == select_move_num }
    enemymoves[select_move_num - 1]
  end
end
