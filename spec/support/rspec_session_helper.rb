include SessionsHelper

module RSpecSessionHelper
  def login
    user = FactoryBot.create(:user)
    log_in user
  end
end
