class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @publication = Publication.find(message_params[:publication_id])
    @chat = Chat.find_by(publication_id: @publication.id)
    @message = Message.new(
      text: message_params[:text],
      user_id: current_user.id,
      chat_id: @chat.id,
      index: @chat.messages.count
    )
    # See whether it associates correctly
    # maybe put it after save
    @message.chat = @chat
    @message.save
    redirect_to @chat
  end

  def destroy
    @message = Message.find(params[:id])
    if current_user == @message.user
      @message.destroy
      redirect_to chat_path
    else
      redirect_to('/403', status: 403)
    end
  end

  private

    # strong parameters
    def message_params
      params.require(:message).permit(:text, :publication_id)
    end
end
