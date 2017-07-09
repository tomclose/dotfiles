begin
  require 'pry'
  puts 'Using pry instead of irb...'
  Pry.start
  exit
rescue LoadError
  puts 'Pry not installed. Using irb.'
end
