require_relative('./corrector')
require_relative('./rental')
class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'unknown', parent_permision: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permision = parent_permision
    @corrector = Corrector.new
    @rental = []
  end

  def of_age?
    @age >= 18
  end

  def can_use_services?
    @parent_permision || of_age?
  end

  def validate_name
    @name = @corrector.correct_name(@name)
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end
  private :of_age?
end
