class Ability
  include CanCan::Ability

  attr_reader :user

  def initialize(user)
    @user = user

    if user.super_admin
      admin_abilities
    else
      if user.roles.empty?
        user_abilities
      else
        user.roles.each do |role|
          case role.name
          when 'admin'
            admin_abilities
          when 'student'
            student_abilities
          when 'teacher'
            teacher_abilities
          when 'project_manager'
            pm_abilities
          when 'curator'
            curator_abilities
          when 'sponsor'
            sponsor_abilities
          when 'field_sponsor'
            field_sponsor_abilities
          when 'mentor'
            mentor_abilities
          end
        end
      end
    end
  end

# =======================================
  def user_abilities
    can :read, [MainField, Field, Wiki, User, Topic, Answer]
    can :read, Course do |course|
      course.access == true
    end
  end
# =======================================

  def admin_abilities
    can :manage, :all
  end

  def common_abilities
    can :read, Course do |course|
      course.access == true
    end
    can :read, MainField
    can :read, Field
    UserAssignment.all.each do |user_assignment|
      if user_assignment.user_id == user.id
        can :read, user_assignment.assignmentable
      end
    end
    can :update, [Topic, Answer] do |obj|
      obj.author_id == user.id
    end
    can :create, [Topic, Answer]
    can :read, [Topic, Answer, Wiki]
  end


  def curator_abilities
    common_abilities
    can :manage, Field do |field|
      !UserAssignment.where(assignmentable: field, user_id: user.id, role_id: Role.find_by(name: "curator").id).empty?
    end
    can :manage, Project do |project|
      !UserAssignment.where(assignmentable: project.field, user_id: user.id, role_id: Role.find_by(name: "curator").id).empty?
    end
    can :manage, UserAssignment
    can :read, [Project, Course, Wiki] do |obj|
      !UserAssignment.where(assignmentable: obj.field, role_id: Role.find_by(name: "curator").id, user_id: user.id).empty?
    end
    can :update, UserAnswer, recipient_id: user.id
  end


  def mentor_abilities
    common_abilities
    can :read, Project do |project|
      !UserAssignment.where(assignmentable: project, user_id: user.id, role_id: Role.find_by(name: "mentor").id).empty?
    end
    can :read, Issue do |issue|
      issue.issuable_type == "Project" && !UserAssignment.where(assignmentable: issue.issuable, user_id: user.id, role_id: Role.find_by(name: "mentor").id).empty?
    end
  end


  def teacher_abilities
    common_abilities
    can :manage, UserAssignment
    can :manage, Course do |obj|
      !UserAssignment.where(assignmentable: obj, user_id: user.id, role_id: Role.find_by(name: "teacher").id).empty?
    end
    can :manage, Issue do |issue|
      !UserAssignment.where(assignmentable: issue.issuable, user_id: user.id, role_id: Role.find_by(name: "teacher").id).empty?
    end
    can :update, UserAnswer, recipient_id: user.id
  end


  def pm_abilities
    common_abilities
    can :manage, UserAssignment
    can :manage, Project do |obj|
      !UserAssignment.where(assignmentable: obj, user_id: user.id, role_id: Role.find_by(name: "project_manager").id).empty?
    end
    can :manage, Issue do |issue|
      !UserAssignment.where(assignmentable: issue.issuable, user_id: user.id, role_id: Role.find_by(name: "project_manager").id).empty?
    end
    can :update, UserAnswer, recipient_id: user.id
  end

  def student_abilities
    common_abilities
    can :create, UserAnswer
    can :update, Issue do |issue|
      issue.users.find(user.id)
    end
  end

  def sponsor_abilities
    common_abilities
    can :read, [Project, Course] do |obj|
      !UserAssignment.where(assignmentable: obj, user_id: user.id, role_id: Role.find_by(name: "sponsor").id).empty?
    end
  end

  def field_sponsor_abilities
    common_abilities
    can :read, [Project, Course] do |obj|
      !UserAssignment.where(assignmentable: obj, user_id: user.id, role_id: Role.find_by(name: "sponsor").id).empty?
    end
  end





end
