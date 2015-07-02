class ItemsusersController < ApplicationController


  def create
    args = {
      user_id: current_user,
      id: params[:id]
    }
    # p args
   @itemsuser_relation = Itemsuser.find_or_create(args)
   render status: 201, json: { everything: 'ok' }
  end

  def update
    @relation = Itemsuser.where(item_id: params[:id], user_id: current_user).first
    @relation.refresh
    render status: 201, json: { everything: 'ok' }
  end

  def destroy
    @relation = Itemsuser.where(item_id: params[:id], user_id: current_user).first
    @relation.destroy
    render status: 201, json: { everything: 'deleted' }
  end

  # def show
  # end

  # def strong_params
  #   params.require(:some_name_of_json).permit(:user_id, :item_id)
  # end

end
