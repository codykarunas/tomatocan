# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def welcome_email
    UserMailer.with(user: User.first).welcome_email
  end
  def purchase_saved
    user = User.new(name: 'user', password: "userpassword", password_confirmation: "userpassword",
             email: "emai@email.com", permalink: "perma")
    merch = Merchandise.first_or_create
    purch = Purchase.new(user: user, merchandise: merch)
    UserMailer.with(seller: User.first, user:user,purchase: purch,merchandise: merch).purchase_saved
    end
  def donation_saved
    user = User.new(name: 'user', password: "userpassword", password_confirmation: "userpassword",
                    email: "emai@email.com", permalink: "perma")
    purch = Purchase.new(user: user)
    UserMailer.with(seller: User.first, user:user,purchase:purch,).donation_saved
  end
end