module Wafflemix
  class ContactForm < ActiveRecord::Base
    attr_accessible :email, :message, :name, :subject

    include Spamster::Model
    spamster_attrs comment_author: :name, comment_author_email: :email, comment_content: :message

    after_create :check_for_spam

    def check_for_spam
      if ENV['AKISMET_SITE_URL'] && ENV['AKISMET_API_KEY']
        self.spam = self.spamster.spam?
        self.save
      end
    end
  end
end
