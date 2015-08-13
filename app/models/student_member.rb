class StudentMember < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, :rollnum, presence: true
  # after_create :send_confirmation_mail

  private
  def send_confirmation_mail

  	fin = File.open "public/mail-templates/welcome.html"
    html_text_from_file = fin.read
    fin.close
    replacer = StringEnumerator.new(:type => ["Student Member"], :name => [self.name])
    html_text_from_file = replacer.enumerate html_text_from_file

    mg_client = Mailgun::Client.new ENV['MAILGUN_API_KEY']
    mb_obj = Mailgun::MessageBuilder.new

    mb_obj.set_from_address("no-reply@erp.alumnicell.com", {"first"=>"SAC", "last" => "Internal ERP"});
    mb_obj.add_recipient(:to, self.email.to_s);
    mb_obj.set_subject("You have registered on the SAC ERP");
    mb_obj.set_text_body("Hello, Just letting you know that your account has been created, Regards, System Administrator.");
    mb_obj.set_html_body(html_text_from_file)

    puts "Sending the email, now!"

    if Rails.env.production?
      mg_client.send_message(ENV['MAILGUN_SENDING_DOMAIN'], mb_obj)
    end

    puts "Mail has been sent! :D"

  end
end
