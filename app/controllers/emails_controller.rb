class EmailsController < ApplicationController
  def index
    @emails = Email.all
  end

  def create
    @email = Email.create!(object: Faker::Books::Lovecraft.word, body: Faker::Books::Lovecraft.paragraph, read: false)
    redirect_to emails_path
  end

  def edit

  end

  def update

  end

  def destroy
    @emails = Email.all
    @email = @emails.find_by(id: params[:id])
    @email.destroy
    redirect_to emails_path
  end

  def show
    @emails = Email.all
    @email = Email.find(params[:id])
    @email.update(read: true)
    @email.save
    respond_to do |format|
      format.turbo_stream
      format.html
    end
  end
end
