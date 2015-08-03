class Api::ItemsController < ApiController
  before_action :authenticated?

  def create
    list = List.friendly.find(params[:list_id])
    item = Item.new(item_params)
    item.list = list
    if item.save
      render json: item
    else
      render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def item_params
    params.require(:item).permit(:body, :user_id)
  end
end
