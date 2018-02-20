require_relative "employee"

class Manager < Employee

  attr_accessor :employees

  def initialize(name, title, salary, boss = nil)
    super(name, title, salary, boss)
    @employees = []
  end

  def bonus(multiplier)
    (employee_sum) * multiplier
  end

  def employee_sum
    employees_salary_sum = 0
    @employees.each do |employee|
      employees_salary_sum += employee.salary
      if employee.is_a? Manager
        employees_salary_sum += employee.employee_sum
      end
    end
    employees_salary_sum
  end
end

# ned = Manager.new("Ned", "Founder", 1000000)
#
# darren = Manager.new("Darren", "TA Manager", 78000, ned)
#
# shawna = Employee.new("Shawna", "TA", 12000, darren)
#
# david =  Employee.new("David", "TA", 10000, darren)
#
# p ned.bonus(5)
# p darren.bonus(4)
# p david.bonus(3)
