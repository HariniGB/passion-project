class User < ActiveRecord::Base
  # Remember to create a migration!
  validates_presence_of :first_name, :last_name, :email, :password_hash
  validates_uniqueness_of :email
  validates :email, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/, message: "only allows letters"}

  has_many :games

  def average_score
    total_games = self.games.count
    total_scores = self.games.sum(:score)
    if total_games > 0
      total_scores / total_games
    else
      total_scores
    end
  end

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(email, password)
    @user = User.find_by(email: email)
    if @user && @user.password == password
      @user
    end
  end

  def matching(initial_password, confirm_password)
     initial_password != confirm_password
  end

end
