def act_as_yield
puts Proc.new.call if block_given?
end

act_as_yield { 2 + 3 }


def pizza_each(type, &block)
  ingredients = case type
    when "Маргарита"
    %w(помидоры сыр базилик)
    when "Маринара"
    %w(помидоры чеснок орегано)
  end
  ingredients.each &block #Мы не передаем методу each аргумент, мы говорим, что переменную block нужно считать блоком.
end

pizza_each("Маргарита") {|el| puts "Кладем #{el}"}

tell_about_pizza = lambda { |x| puts "В этой пицце есть #{x}" }

pizza_each "Маринара", &tell_about_pizza #Здесь мы передаем методу pizza_each один аргумент и один блок.

class String
  def to_proc
    Proc.new { |x| puts(self + x) }
  end
end

pizza_each "Маргарита", &"Для ее приготовления нужны "

# Если передать в качестве блока символ (символьный объект), это равносильно передаче блока,
# в котором у аргумента будет вызываться одноименный метод.
puts %w(моцарелла оливки грибы).map { |el| el.reverse }

puts %w(горгонзола розмарин салями).map &:reverse

