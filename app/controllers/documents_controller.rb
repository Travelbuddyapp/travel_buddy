class DocumentsController < ApplicationController
  before_action :document, only: [:show, :edit, :update, :destroy]
  before_action :user

  def index
    @documents = Document.where(user_id:params[:user_id])
  end

  def show
  end

  def new
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)
    @document.user = @user
    if @document.save
      redirect_to user_documents_path(@user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @document.update(document_params)
      redirect_to user_documents_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @document.destroy
    redirect_to user_documents_path(@user)
  end

  private

  def document_params
    params.require(:document).permit(:name, :expiration_date, :attachment)
  end

  def document
    @document = Document.find(params[:id])
  end

  def user
    @user = current_user
  end

end
