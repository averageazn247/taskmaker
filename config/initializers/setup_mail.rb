ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "gmail.com",
  :user_name            => "khoa.bot.dont.reply@gmail.com",
  :password             => "naggers9804",
  :authentication       => "plain",
  :enable_starttls_auto => true
}

# Pony delivery via SMTP
PONY_CONFIG = { 
  :via => :smtp, 
  :via_options => {
    :address              => "smtp.gmail.com",
    :port                 => 587,
    :user_name            => "khoa.bot.dont.reply@gmail.com",
    :password             => "naggers9804",
    :authentication       => "plain", 
    :enable_starttls_auto => true,
    :domain               => "gmail.com"
}}

sms_fu = SMSFu::Client.configure(:delivery => :pony, :pony_config => PONY_CONFIG)