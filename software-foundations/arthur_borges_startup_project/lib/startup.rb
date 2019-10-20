require "employee"

class Startup
  attr_reader :name, :funding, :salaries, :employees

  def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = salaries
    @employees = []
  end

  def valid_title?(title)
    salaries.key?(title)
  end

  def >(startup)
    self.funding > startup.funding
  end

  def hire(name, title)
    if salaries.key?(title)
      @employees << Employee.new(name, title)
    else
      raise 'Title is invalid'
    end
  end

  def size
    @employees.length
  end

  def pay_employee(employee)
    payment = salaries[employee.title]
    if @funding > payment
      employee.pay(payment)
      @funding -= payment
    else
      raise 'Startup does not have enough funding to pay the employee'
    end
  end

  def payday
    employees.each {|employee| pay_employee(employee)}
  end

  def average_salary
    employee_salary = {}
    @employees.each {|employee| employee_salary[employee.name] = @salaries[employee.title]}
    employee_salary.values.sum / employee_salary.length
  end

  def close
    @employees = []
    @funding = 0
  end

  def acquire(startup)
    @funding += startup.funding
    startup.salaries.each do |title, salary|
      if !@salaries.key?(title)
        @salaries[title] = salary
      end
    end
    @employees += startup.employees
    startup.close
  end
end
