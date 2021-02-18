class Move
  attr_reader :id, :name, :type
  @@count = 0

  def initialize(move_params)
    @id = @@count += 1
    @name = move_params[:name]
    @type = move_params[:type]
  end
end
