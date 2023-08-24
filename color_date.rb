class color_date

    require_relative 'ruby-ev3/lib/ev3'
    
    LEFT_MOTOR = "C"
    RIGHT_MOTOR = "B"
    PORT = "COM4"
    MOTOR_SPEED = 50
    
    arr = [[0,0,0,0],[0,0,0,0],[0,0,0,0]]

    for i in 0..3 do
        for n in 0..3 do

            case COLOR_SENSOR
            when 6 then #white
                arr[i][n] = 0 
            when 5 then #red
                arr[i][n] = 1
            when 2 then #blue
                arr[i][n] = 2
            when 3 then #green
                arr[i][n] = 3
            end   
            
            dy = 1
            @ev3_controller.move_forward(2)
        end
      end

    puts arr
end



      

