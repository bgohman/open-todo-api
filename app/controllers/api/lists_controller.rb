class Api::ListsController < ApiController
  before_action :authenticated?


  def index
    lists = List.all
    authorize lists
    render json: lists, each_serializer: UserSerializer
  end

  def create
    list = List.new(list_params)
    if list.save
      render json: list
    else
      render json: { errors: list.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    begin
      list = List.friendly.find(params[:id])
      list.destroy
      render json: {}, status: :no_content
    rescue ActiveRecord::RecordNotFound
      render json: {}, status: :not_found
    end
  end

  def update
    list = List.friendly.find(params[:id])
    if list.update(list_params)
      render json: list
    else
      render json: { errors: list.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private 
    def list_params
      params.require(:list).permit(:title, :list_id, :permissions)
    end
end
