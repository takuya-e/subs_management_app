class UserContractsController < ApplicationController
  def index
    @user_contracts = UserContract.all.order(contract_date: :asc )
  end

  def show
  end

  def new
    @user_contract = UserContract.new
    @subscriptions = Subscription.all
  end

  def create
    @user_contract = UserContract.new(contract_date: user_contract_params[:contract_date], cancellation_date: user_contract_params[:cancellation_date], user_id: current_user.id, subscription_id: user_contract_params[:subscription_id])
    
    if @user_contract.save!
      redirect_to user_contracts_path, notice: "登録が完了しました"
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def user_contract_params
    params.require(:user_contract).permit(:contract_date, :cancellation_date, :user_id, :subscription_id)
  end

end
