class Person
  @@auto_increment = 1
  def initialize name
    @id = @@auto_increment
    @@auto_increment += 1
    @name = name
    @gender = nil
  end
end

class Relationship
  def initialize name, person1, person2
    if ["son", "daughter", "wife", "husband"].exclude?(name)
      raise "Relationship should be one of son, daughter, wife, husband"
    end

    @name = name
    @person1 = person1
    @person2 = person2
  end
end


persons = []
relationships = []
a = Person("John Shakespear")
b = Person("Mary Arden")
persons.push(a)
persons.push(b)

relationships.push(Relationship("husband", a, b))


["Joan", "Margaret", "Anne", "Joan"].each do |name|
  c = Person(name)
  relationships.push(Relationship("daughter", c, a))
end

c = Person("William")
d = Person("Anne Hathaway")
relationships.push(Relationship("son", c, a))
relationships.push(Relationship("husband", c, d))

["Gillbert", "Richard", "Edmund"].each do |name|
  c = Person(name)
  relationships.push(Relationship("son", c, a))
end




=begin

son
daughter
wife
husband






A is son of B
B is wife of C
D is daughter of C


Person(
  A
  Male
)

Person(
  B
  Female
)

Person(
  C
  Male
)

Person(
  D
  Female
)

Relationship(

)
=end
