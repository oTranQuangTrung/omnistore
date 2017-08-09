class CollectionsController < ApplicationController
  before_action :handle_user_not_has_any_shop
  before_action :load_collection, except: [:index, :new, :create]

  def index
    @collections = current_shop.collections.lastest.page(params[:page])
      .per(Settings.pagination.collections).decorate
  end

  def new
    @collection = current_shop.collections.new
  end

  def create
    @collection = current_shop.collections.new collection_params
    if @collection.save
      flash[:success] = t ".created", name: Collection.model_name.human
      redirect_to collections_path
    else
      flash[:alert] = t ".error_create", name: Collection.model_name.human
      render :new
    end
  end

  def edit
  end

  def update
    if @collection.update_attributes collection_params
      flash[:success] = t ".updated", name: Collection.model_name.human
      redirect_to collections_path
    else
      flash[:alert] = t ".error_update", name: Collection.model_name.human
      render :edit
    end
  end

  def destroy
    if @collection.destroy
      flash[:success] = t ".deleted", name: Collection.model_name.human
    else
      flash[:alert] = t ".error_deleted", name: Collection.model_name.human
    end
    redirect_to collections_path
  end

  private
  def collection_params
    params.require(:collection).permit :shop_id, :name, :description,
      :featured_image, :featured_image_cache, :public, :published_at
  end

  def load_collection
    @collection = current_shop.collections.find params[:id]
  end
end
