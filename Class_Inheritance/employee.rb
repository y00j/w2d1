class Employee
  attr_accessor :name, :title, :boss, :salary

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
    @boss.employees << self if boss
  end

  def bonus(multiplier)
    bonus = (salary) * multiplier
  end
end
