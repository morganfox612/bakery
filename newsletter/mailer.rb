class Newsletter < ActionMailer::Base
   default from: "from@example.com"
   def subscribe(recipient)
     mail(to: recipient, subject: 'Welcome to Sugar Street Sweets')
   end
end
