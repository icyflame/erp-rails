class StudentMember < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
		 :recoverable, :rememberable, :trackable, :validatable
  validates :name, :rollnum, presence: true
  after_create :send_confirmation_mail

  private
  def send_confirmation_mail

  	fin = File.open "public/mail-templates/welcome.html"

  	html_text_from_file = fin.read

  	fin.close

  	replacer = StringEnumerator.new(:type => ["Student Member"], :name => [self.name])

  	html_text_from_file = replacer.enumerate html_text_from_file

		require_relative './mailgun.rb'

		mg_client = Mailgun::Client.new "key-74e2fcede7797b9b869f574c965c9b0d"

		message_params = {:from    => 'no-reply@erp.alumnicell.com',
		                  :to      => self.email,
		                  :subject => 'You have registered on the SAC ERP',
		                  :text    => 'Hello, Just letting you know that your account has been created, Regards,\n\nSystem Administrator.',
		                  :html    => html_text_from_file
		                }

		puts "Sending the email, now!"

		mg_client.send_message "sandbox3a6bc1bbcfc149ba9e95376871456536.mailgun.org", message_params

  end
end
