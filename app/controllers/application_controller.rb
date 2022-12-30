class ApplicationController < ActionController::Base
  def hello
    render html: 'yup'
  end
end
