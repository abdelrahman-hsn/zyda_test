class MessagesController < ApplicationController
  before_action :set_message, only: %i[ show update destroy ]
  before_action :set_chat

  # GET /messages
  def index
    @messages = @chat.messages.order(message_index: :asc)

    render json: @messages
  end

  # GET /messages/1
  def show
    render json: @message
  end

  # POST /messages
  def create
    MessageCreation.preform_later(message_params)
  end

  # PATCH/PUT /messages/1
  def update
    if @message.update(message_params)
      render json: @message
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  # DELETE /messages/1
  def destroy
    @message.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = @chat.messages.find(params[:id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_chat
      @chat = Chat.find(params[:chat_id]).include(:messages)
    end

    # Only allow a list of trusted parameters through.
    def message_params
      params.require(:message).permit(:name)
    end
end
