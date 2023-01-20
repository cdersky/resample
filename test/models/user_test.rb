require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "example user", email: 'unn@example.com', password_confirmation: 'foobar')
  end

  test 'should be valid' do
    assert @user.valid?
  end

  test 'name should be present' do
    @user.name = "           "
    assert_not @user.valid?
  end

  test 'email should be present' do
    @user.email = '       '
    assert_not @user.valid?
  end

  test 'name should not be too long' do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test 'email should not be too long' do
    @user.email = "a" * 280
    assert_not @user.valid?
  end

  test 'email validations should accept valid addresses' do
    valid_addresses = %w[u@e.com U@f.COM A_f-r@f.f.org f.f@f.jp a+b@c.cn]
    valid_addresses.each do |v|
      @user.email = v
      assert @user.valid?, "#{v.inspect} should be valid"
    end
  end

  test 'email validations should reject invalid addresses' do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com foo@bar..com]
    invalid_addresses.each do |i|
      @user.email = i
      assert_not@user.valid? "#{i} should be invalid"
    end
  end

  test 'emails should be unique' do
    dup_user = @user.dup
    @user.save
    assert_not dup_user.valid?
  end

  test 'email addresses should be saved as lower-case' do
    mixed_case_email = 'Fo@Ex.Com'
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  test 'password should be present (nonblank)' do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test 'password should have a min length' do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
end
