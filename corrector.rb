class Nameable
  def correct_name
    raise NotImplementedError
  end
end

class Corrector < Nameable
  attr_accessor :nameable

  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @namable.correct_name
  end
end

class CapitalizeCorrector < Corrector
  def correct_name
    @nameable.correct_name.capitalize
  end
end

class TrimmerCorrector < Corrector
  def correct_name
    @nameable.correct_name.slice(0, 10) unless @nameable.correct_name.length <= 10
  end
end
