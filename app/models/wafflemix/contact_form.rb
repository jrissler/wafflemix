module Wafflemix
  class ContactForm < ActiveRecord::Base
    attr_accessible :email, :message, :name, :subject
  end
end
