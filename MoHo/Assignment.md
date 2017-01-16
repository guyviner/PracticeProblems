#Q1. Write a function that rejects a receipt submission if the amount of that receipt plus the total of their existing receipts for the current month exceeds a $200 budget.

def check_receipt(budget)
  monthly_total = Receipts.where('extract(month from created_at) = ?', Time.zone.now.month).sum(:amount)
  monthly_total + amount >= budget ? true : false
end

/app/controllers/application_controller.rb
# fetch the currently logged-in user in order to associate the receipt with
# them upon saving it.
def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id].present?
end

----------------------------------------------------------

/app/controllers/receipts_controller.rb

# restrict access to receipt actions to only logged-in users
before_action :authenticate_user

def receipts_create
  # define what constitutes an acceptable receipt.
  # This is a simplified example.
  receipt_params = params.require(:receipt).permit(:amount)
  # instantiate a new receipt with the parameters defined above
  @receipt = Receipt.new receipt_params
  # associate the instantiated receipt to the current user
  @receipt.user = current_user
  # define what happens if the receipt passes validations and saves
  # successfully to the database
  if @receipt <=
    if @receipt.save
      redirect_to receipts_index_path, notice: 'Receipt saved!'
    else
      redirect_to

end


<!-- def receipts_edit
    @receipt = Receipt
    .find(params[:id])
    if @receipt.house_id != current_user.house_id
      redirect_to receipts_residents_path
end -->

/app/models/receipt.rb
class Receipt < ApplicationRecord
  belongs_to :user
  validates :amount, { numericality: { less_than_or_equal_to: available_budget } }

  def available_budget
    current_user.
  end
end

def create
    @campaign        = Campaign.find params[:campaign_id]
    pledge_params    = params.require(:pledge).permit(:amount)
    @pledge          = Pledge.new pledge_params
    @pledge.campaign = @campaign
    if @pledge.save
      redirect_to new_pledge_payment_path(@pledge), notice: 'Pledge created!'
    else
      flash.now[:alert] = 'Pledge not created.'
      render 'campaigns/show'
    end
  end
end

# Q2. You receive a ticket from a user stating only the following: "Program upload doesn't work." Please draft (a) your response to the user and (b) the next 3 steps you would take.
#
# A2.Prior to sending a response I would have a quick look at any logs that may have
# accompanied the ticket in order to get a better understanding of the issue
# (who, from what page, what error message, etc.). I would also review recent
# user activity to check whether the issue had already been resolved by the user at some
# point after they had submitted the ticket, in which case I'd ask the user about that.
# Assuming no additional insight could be garnered from the ticket, I'd draft:
#
# Hey User,
# Sorry you're experiencing difficulty. In order to allow me to assist you I'm
# going to need a little more information. Can you please provide for me:
# 1) what exact page you were (please copy the URL, or take a screenshot),
# 2) what information you were trying to submit?
# 3) what error message (if any) you got upon trying to upload the program?
# Best,
# Guy


# Q3. N+1 problem
# N+1 query problem is a situation when you are making an extra call(s) to the database when you want to get a specific associated data over and over again. For example:
# irb(main):001:0> Receipt.all.each { |receipt| receipt.program.name }  
#  Receipt Load (0.9ms)  SELECT "receipts".* FROM "receipts"
#  Program Load (0.1ms)  SELECT  "programs".* FROM "programs" WHERE "programs"."id" = ? LIMIT 1  [["id", 1]]
#  Program Load (0.0ms)  SELECT  "programs".* FROM "programs" WHERE "programs"."id" = ? LIMIT 1  [["id", 1]]
#  Program Load (0.0ms)  SELECT  "programs".* FROM "programs" WHERE "programs"."id" = ? LIMIT 1  [["id", 1]]
#  Program Load (0.0ms)  SELECT  "programs".* FROM "programs" WHERE "programs"."id" = ? LIMIT 1  [["id", 2]]
#  Program Load (0.0ms)  SELECT  "programs".* FROM "programs" WHERE "programs"."id" = ? LIMIT 1  [["id", 2]]
#
# This causes a bottleneck in your page load time and can result in a server timeout. How would you optimize the above query to eliminate the N+1 problem?
# b tree algothm if indexed
# sort once,
# Q4. A support ticket has been submitted through a mobile application and the user says they cannot login. What are some questions you can ask them before consulting the engineering team?
#
# A4. Hey User,
# Did the application give you an error message?
# Were you able to log in before? Have you double checked the spelling of your
# username and password?
# Please let us know and we'll assist you further to resolve this issue.
# Best,
# Guy
#
# 5. Explain the ideal Bug lifecycle.
#
# 6. How would you thoroughly test the software (as the last line of defense) before marking the bug as FIXED (or RESOLVED)?
# rspec
# test for edge cases  #
