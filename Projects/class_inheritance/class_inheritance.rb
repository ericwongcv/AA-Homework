require "byebug"

class Employee
    
    attr_reader :name, :title, :salary, :boss

    def initialize(name, title, salary, boss = nil)
        @name, @title, @salary, @boss = name, title, salary, boss
    end

    def bonus(multiplier)
        bonus = salary * multiplier
    end
    
end

class Manager < Employee

    attr_reader :employees

    def initialize(name, title, salary, boss=nil)
        super(name, title, salary, boss)
        @employees = []
    end

    def add_employee(employee)
        employees << employee
    end

    def bonus(multiplier)
        sub_salaries * multiplier
    end

    def sub_salaries
        sum_salaries = 0

        employees.each do |employee|
            if employee.is_a?(Manager)
                sum_salaries += employee.salary + employee.sub_salaries
            else
                sum_salaries += employee.salary
            end
        end

        sum_salaries
    end

end

ned = Manager.new("Ned", "Founder", 1000000)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)

ned.add_employee(darren)
darren.add_employee(shawna)
darren.add_employee(david)

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000