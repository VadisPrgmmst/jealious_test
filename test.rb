# coding: utf-8

class Test

  attr_accessor :yes_answers_count, :version

  def initialize(questions_file_name)
    current_path = File.dirname(__FILE__)
    abort "Файл не найден" unless File.exist?(current_path + questions_file_name)
    @questions = File.readlines(current_path + questions_file_name)
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
    until (user_input == "да" || user_input == "нет")
      puts "введите 'да' или 'нет' и нажмите Enter"
      user_input = STDIN.gets.strip.chomp.downcase
    end
    update_yes_answers_count(user_input)
  end

  def update_yes_answers_count(user_input)
    # увеличиваем значение переменной на единицу
    @yes_answers_count += 1 if (user_input == "да")
  end

end