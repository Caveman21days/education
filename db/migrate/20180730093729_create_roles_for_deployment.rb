class CreateRolesForDeployment < ActiveRecord::Migration[5.1]
  def change
    Role.create name: "curator"
    Role.create name: "admin"
    Role.create name: "student"
    Role.create name: "project_manager"
    Role.create name: "teacher"
    Role.create name: "Исполнитль"
    Role.create name: "Проверяющий"
  end
end
