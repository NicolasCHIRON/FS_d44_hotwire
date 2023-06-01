class EmailsController < ApplicationController
  def index
    @emails = Email.all
  end

  def create
    @email = Email.create!(object: Faker::Books::Lovecraft.word, body: Faker::Books::Lovecraft.paragraph, read: false)

    respond_to do |format|
      format.html do
        redirect_to emails_path
      end
    end
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
    @email = Email.find(params[:id])
    @email.update(read: true)
    @email.save
    respond_to do |format|
      format.html { redirect_to email_path(@email) }
      format.js { }
    end
  end
end
