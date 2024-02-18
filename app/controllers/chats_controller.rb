class ChatsController < ApplicationController
  before_action :set_app
  before_action :check_app
  before_action :set_chat, only: %i[ show update destroy ]

  # GET /chats
  def index
    @chats = @app.chats.order(chat_index: :asc)

    render json: @chats
  end

  # GET /chats/1
  def show
    render json: @chat
  end

  # POST /chats
  def create
    @chat = @app.chats.new(chat_params)
    @chat.chat_index = @app.chats_count + 1
    if @chat.save
      render json: @chat, status: :created, location: @chat
    else
      render json: @chat.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /chats/1
  def update
    if @chat.update(chat_params)
      render json: @chat
    else
      render json: @chat.errors, status: :unprocessable_entity
    end
  end

  # DELETE /chats/1
  def destroy
    @chat.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chat
      @chat = @app.chats.find(params[:id])
    end

    def set_app
      @app = Application.find_by(token: params[:token]).include(:chats)
    end

    # Only allow a list of trusted parameters through.
    def chat_params
      params.require(:chat).permit(:name)
    end

    def check_app
      unless @app.present?
      # raies error if the app not present
    end
end
