class Navigator < Character
  def update(map)
    dx = 0
    dy = 0

    if Input.key_push?(K_DOWN)
      #    binding.irb
       dy = 1
       @ev3_controller.move_forward(2)
     end

    if Input.key_push?(K_UP)
      #    binding.irb
      dy = -1
      @ev3_controller.move_back(2)
    end

    if Input.key_push?(K_RIGHT)
      #    binding.irb
      dx = 1
      @ev3_controller.right_torun(1.9)
    end

    if Input.key_push?(K_LEFT)
      #    binding.irb
      dx = -1
      @ev3_controller.left_torun(1.9)
    end

    @ev3_controller.search

    update_new_position(map, @x + dx, @y + dy)

    @ev3_controller.update_sensor_value

  end
end