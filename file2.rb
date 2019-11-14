def act_as_yield
puts Proc.new.call if block_given?
end

act_as_yield { 2 + 3 }
