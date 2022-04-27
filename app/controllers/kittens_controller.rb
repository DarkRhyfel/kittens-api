# frozen_string_literal: true

# Kitten controller for routes
class KittensController < ApplicationController
  before_action set_kitten, only: %i[show edit update destroy]

  def index
    @kittens = Kitten.all
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)

    if @kitten.save
      respond_to do |format|
        format.html { redirect_to @kitten }
      end
    else
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def show; end

  def edit; end

  def update
    if @kitten.update(kitten_params)
      respond_to do |format|
        format.html { redirect_to @kitten }
      end
    else
      respond_to do |format|
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @kitten.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def set_kitten
    @kitten = Kitten.find(params[:id])
  end

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
