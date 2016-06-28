# coding: utf-8

class Test

  attr_accessor :yes_answers_count, :version

  def initialize
    current_path = File.dirname(__FILE__)
    abort "Файл не найден" unless File.exist?(current_path + "/data/questions.txt")
    @questions = File.readlines(current_path + "/data/questions.txt")
    @yes_answers_count = 0
    @version = "Тест \"Ревнивы ли вы\". Версия 0.4. (c) 2016 Vadim Galkin\n\n"
  end

  def pass_test
    @questions.each do |question|
      puts question # вывели на экран след. вопрос
      get_user_answer
      puts
    end
  end
  
  def get_user_answer
    user_input = nil
    #  цикл повторяющий просьбу ввести ответ до тех пор, пока не будет введен правильный ответ
    until (user_input == "yes" || user_input == "no")
      puts "введите 'yes' или 'no' и нажмите Enter"
      user_input = STDIN.gets.chomp.downcase
    end
    update_yes_answers_count(user_input)
  end

  def update_yes_answers_count(user_input)
    # увеличиваем значение переменной на единицу
    @yes_answers_count += 1 if (user_input == "yes")
  end

end