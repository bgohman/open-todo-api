class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @list = List.friendly.find(params[:list_id])
    @item = Item.new(item_params)
    @item.list = @list
    @item.user = current_user
    if @item.save
      flash[:notice] = "item was created."
      redirect_to @list
    else
      flash[:error] = "There was an error saving the item. Please try again."
      render :new
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    @list = List.friendly.find(params[:list_id])
    if @item.update(item_params)
      flash[:notice] = "item was updeated."
      redirect_to @list
    else
      flash[:error] = "There was an error saving the item. Please try again."
      render :new
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @list = @item.list
    @item.destroy
    respond_to do |format|
      format.html { redirect_to @list, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def completed
    @items = Item.find(params[:item_ids])
    @items.each do |item|
      item.update_attributes(completed: true)
    end
    @list = @items.first.list
    redirect_to @list
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:body, :user, :completed)
    end
end
