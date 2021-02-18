class EnemyMove
  attr_reader :id, :name, :type
  @@count = 0

  def initialize(enemy_move_params)
    @id = @@count += 1
    @name = enemy_move_params[:name]
    @type = enemy_move_params[:type]
  end
end
