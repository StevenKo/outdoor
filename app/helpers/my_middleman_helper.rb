module MyMiddlemanHelper

  def lorem_first_name num=10
    Lorem::Base.new('chars', num).output 
  end

  def lorem_name num=10
    Lorem::Base.new('chars', num).output 
  end
    
  def lorem_word num=10
    Lorem::Base.new('chars', num).output
  end

  def lorem_words num=10
    Lorem::Base.new('words', num).output
  end

  def lorem_sentence num=10
    Lorem::Base.new('words', num).output
  end
    
  def lorem_date years_back=5
    year = Time.now.year - rand(years_back) - 1
    month = rand(12) + 1
    day = rand(31) + 1
    Time.local(year, month, day)
  end

  def lorem_image size
    'http://placehold.it/'+size
  end
  
end