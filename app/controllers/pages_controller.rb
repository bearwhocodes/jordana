class PagesController < ApplicationController
  before_action :set_page, only: [:show, :update]
  before_action :authenticate_user!, only: [:update]

  def show
    
  end

  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to @page, notice: 'Page was successfully updated.' }
        format.json { render :show, status: :ok, location: @page }
      else
        format.html { render :show }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

private

  def set_page
    if ['home', 'about'].include? params[:id]
      @page = Page.find_by_slug(params[:id])
    else
      @page = Page.find(params[:id])
    end
  end

  def page_params
    params.require(:page).permit(:slug, page_elements_attributes: [:html, :slug, :id])
  end

end