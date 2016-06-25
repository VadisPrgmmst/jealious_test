# coding: utf-8

class MainLogicTest

  attr_accessor :yes_answers, :version, :questions

  def initialize
    @version = "Тест \"Ревнивы ли вы\". Версия 0.4. (c) 2016 Vadim Galkin\n\n"
    @questions = nil
    @yes_answers = 0  
  end

  def pass_test
    @questions.each do |question|
      puts question # вывели на экран след. вопрос

      yes_or_no

      puts
    end
  end
  
  def yes_or_no

    user_input = nil
    #  цикл повторяющий просьбу ввести ответ до тех пор, пока не будет введен правильный ответ
    until (user_input == "yes" || user_input == "no")
      puts "введите 'yes' или 'no' и нажмите Enter"

      user_input = STDIN.gets.chomp.downcase
    end

    calculate_yes(user_input)
  end

  def calculate_yes(user_input) 
    # увеличиваем значение переменной на единицу
    @yes_answers += 1 if (user_input == "yes")
  end

end