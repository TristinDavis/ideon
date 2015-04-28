class TagsController < ApplicationController
  before_action :set_tag, only: [
                            :show,
                            :toggle_favorite,
                            :edit,
                            :update,
                            :destroy
                          ]

  # GET /tags
  def index
    @tags = current_user.tags
  end

  # GET /tags/1
  def show
  end

  # GET /tags/new
  def new
    @tag = Tag.new
  end

  # GET /tags/1/edit
  def edit
  end

  # POST /tags
  def create
    @tag = Tag.new(tag_params)
    @tag.user = current_user

    if @tag.save
      redirect_to tags_path, notice: 'La etiqueta fue creada correctamente.'
    else
      render :new
    end
  end

  # PATCH/PUT /tags/1
  def update
    if @tag.update(tag_params)
      redirect_to @tag, notice: 'La etiqueta fue actualizada correctamente.'
    else
      render :edit
    end
  end

  # DELETE /tags/1
  def destroy
    @tag.destroy
    redirect_to tags_url, notice: 'La etiqueta fue borrada correctamente.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tag_params
      params.require(:tag).permit(
        :name,
      )
    end
end
