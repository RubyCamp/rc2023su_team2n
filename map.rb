    class Map
        CHIP_SIZE = 200
        def initialize(map_data_path)
          @map_data = []
          File.open(map_data_path) do |f|
            f.each do |line|
              @map_data << line.chomp.split(/\s*,\s*/)
            end
          end
          @white_box = Image.new(180,180,color=[255,255,255,255])
          @red_box   = Image.new(180,180,color=[255,255,0,0])
          @blue_box  = Image.new(180,180,color=[255,0,0,255])
          @green_box = Image.new(180,180,color=[255,0,255,0])
        end
      
        def update
        end

        def updata_map(new_data)
          @map_data = new_data
        end
      
        def draw
          @map_data.each_with_index do |line, my|
            line.each_with_index do |chip_num, mx|
              case chip_num.to_i
              when 0
                Window.draw((mx * CHIP_SIZE) + 10, (my * CHIP_SIZE) + 10, @white_box)
              when 1
                Window.draw((mx * CHIP_SIZE) + 10, (my * CHIP_SIZE) + 10, @red_box)
              when 2
                Window.draw((mx * CHIP_SIZE) + 10, (my * CHIP_SIZE) + 10, @blue_box)
              when 3
                Window.draw((mx * CHIP_SIZE) + 10,( my * CHIP_SIZE) + 10, @green_box)
              end
            end
          end
        end
       # 指定されたマップ座標[new_x, new_y]が進入可能かどうかを真偽値で返す。
       def is_available?(new_x, new_y)
         if @map_data[new_y]
           return @map_data[new_y][new_x].to_i != 1
         end
         return false
       end
      end

      