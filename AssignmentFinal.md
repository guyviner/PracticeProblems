Q1. Write a function that rejects a receipt submission if the amount of that receipt plus the total of their existing receipts for the current month exceeds a $200 budget.

function check_receipt takes budget as its argument
def check_receipt(budget)
  we calculate the monthly total by summing up the amounts of all the
  receipts for the current month using a SQL query
  monthly_total = Receipts.where('extract(month from created_at) = ?', Time.zone.now.month).sum(:amount)
  we add that total to the receipt amount (using the attribute accessor
  'amount' for receipt from Rails) and use a ternary operator to check
  against the monthly budget
  monthly_total + amount >= budget ? false : true
end

example use:
receipt.check_receipt(200)
###############################################################################
Q2. You receive a ticket from a user stating only the following: "Program upload doesn't work." Please draft (a) your response to the user and (b) the next 3 steps you would take.

I would do (b) before (a). That is to say:
Prior to sending a response I would have a quick look at any logs that may have
accompanied the ticket in order to get a better understanding of the issue
(from whom, from what page, what error message given, etc.). I would also review recent
user activity to check whether the issue had already been resolved by the user at some
point after they had submitted the ticket, in which case I'd ask the user about that.
Assuming no additional insight could be garnered from the ticket beyond the
message itself, I'd draft:

Hey User,
Sorry you're experiencing difficulty. In order to allow me to assist you I'm
going to need a little more information. Can you please provide for me:
1) what exact page you were on (please copy the URL and if possible send a screenshot).
2) what information you were trying to upload?
3) what error message (if any) you got upon trying to upload the program?
Best,
Guy
###############################################################################
Q3.
N+1 problem
N+1 query problem is a situation when you are making an extra call(s) to the database when you want to get a specific associated data over and over again. For example:
irb(main):001:0> Receipt.all.each { |receipt| receipt.program.name }  
 Receipt Load (0.9ms)  SELECT "receipts".* FROM "receipts"
 Program Load (0.1ms)  SELECT  "programs".* FROM "programs" WHERE "programs"."id" = ? LIMIT 1  [["id", 1]]
 Program Load (0.0ms)  SELECT  "programs".* FROM "programs" WHERE "programs"."id" = ? LIMIT 1  [["id", 1]]
 Program Load (0.0ms)  SELECT  "programs".* FROM "programs" WHERE "programs"."id" = ? LIMIT 1  [["id", 1]]
 Program Load (0.0ms)  SELECT  "programs".* FROM "programs" WHERE "programs"."id" = ? LIMIT 1  [["id", 2]]
 Program Load (0.0ms)  SELECT  "programs".* FROM "programs" WHERE "programs"."id" = ? LIMIT 1  [["id", 2]]

This causes a bottleneck in your page load time and can result in a server timeout. How would you optimize the above query to eliminate the N+1 problem?

Receipt.includes(:program).all.each { |receipt| receipt.program.name }
Receipt.preload(:program).all.each { |receipt| receipt.program.name }
The above modified queries leverage eager loading to reduce the number of
hits to the database to effectively just two.
###############################################################################
Q4. A support ticket has been submitted through a mobile application and the user says they cannot login. What are some questions you can ask them before consulting the engineering team?

A4. Hey User,
Did the application give you an error message? If so, what was it?
Were you able to log in before?
Have you double checked the correctness of your username and password?
Have you tried resetting your password?
Please let us know and we'll assist you further to resolve this issue.
Best,
Guy
###############################################################################
5. Explain the ideal Bug lifecycle.

The ideal bug lifecycle depends on the specific needs of the organization, but the following is a common workflow of defects/bugs that takes them from 'new' to 'closed':
New:  When a defect is logged and posted for the first time. It’s state is given as new.
Assigned:  After the tester has posted the bug, the lead of the tester approves that the bug is genuine and he assigns the bug to corresponding developer and the developer team. It’s state given as assigned.
Open:  At  this state the developer has started analyzing and working on the defect fix.
Fixed:  When developer makes necessary code changes and verifies the changes then he/she can make bug status as ‘Fixed’ and the bug is passed to testing team.
Pending retest:  After fixing the defect the developer has given that particular code for retesting to the tester. Here the testing is pending on the testers end. Hence its status is pending retest.
Retest:  At this stage the tester do the retesting of the changed code which developer has given to him to check whether the defect got fixed or not.
Verified:  The tester tests the bug again after it got fixed by the developer. If the bug is not present in the software, he approves that the bug is fixed and changes the status to “verified”.
Closed:  Once the bug is fixed, it is tested by the tester. If the tester feels that the bug no longer exists in the software, he changes the status of the bug to “closed”. This state means that the bug is fixed, tested and approved.

###############################################################################
6. How would you thoroughly test the software (as the last line of defense) before marking the bug as FIXED (or RESOLVED)?

Put the software through a thorough test suite, that also tests for edge cases, and the different stages in the execution of the code.
Ideally make sure the tests should fail at least once, which helps to make sure that you're testing for the right things.
Consider asking for a code review, and/or brainstorming with a colleague or an end user to make sure the tests are correct in both validation and verification.
