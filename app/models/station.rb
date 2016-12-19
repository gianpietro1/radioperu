class Station < ActiveRecord::Base

  translates :name, :description
  has_many :programs, dependent: :destroy
  has_many :genres
  has_many :artists, :through => :genres

  default_scope  { order('id ASC') }

  def program_active
    self.programs.each do |prog|
      if prog.days_array.include? (Time.now.wday + 1).to_s
        @time_start = prog.program_start.strftime( "%H" ).to_i * 3600 + prog.program_start.strftime( "%M" ).to_i * 60
        @time_end = prog.program_end.strftime( "%H" ).to_i * 3600 + prog.program_end.strftime( "%M" ).to_i * 60
        @time_current = Time.now.strftime( "%H").to_i * 3600 + Time.now.strftime( "%M").to_i * 60
        if (@time_end > @time_start) && (@time_start <= @time_current && @time_current <= @time_end) || (@time_end < @time_start) && (@time_start <= @time_current || @time_current <= @time_end)
          @program_active = prog
        end
      end
    end
    return @program_active
  end


end
