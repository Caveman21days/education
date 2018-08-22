class AdvancedAbilitiesController < ApplicationController
  skip_authorization_check

  def create
    abilities_params
    redirect_to @object
  end

  private

  def abilities_params
    keys = []
    params["advanced_abilities"].keys.each { |k| keys << k.split('_') }

    AdvancedAbility.where(objectable_type: keys[0][0], objectable_id: keys[0][1]).destroy_all
    keys.each do |key|
      AdvancedAbility.create(
        objectable_type: key[0].classify.constantize,
        objectable_id: key[1],
        role_id: key[2],
        ability_name: key[3],
        access: 1
      )
    end
    @object = keys[0][0].classify.constantize.find(keys[0][1])
  end
end
