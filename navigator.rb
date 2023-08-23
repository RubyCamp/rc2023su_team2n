class Navigator < Character
  def update(map)
    dx = 0
    dy = 0
    dx = 1 if Input.key_push?(K_RIGHT)
    dx = -1 if Input.key_push?(K_LEFT)
    dy = -1 if Input.key_push?(K_UP)

    if Input.key_push?(K_DOWN)
 #    binding.irb
      dy = 1
      @ev3_controller.move_forward(2)
    end

    if Input.key_push?(K_UP)
      #    binding.irb
       dy = 1
       @ev3_controller.move_forward(2)
     end

    update_new_position(map, @x + dx, @y + dy)

    @ev3_controller.update_sensor_value

  end
end