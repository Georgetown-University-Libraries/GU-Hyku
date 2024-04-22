class HandleCount < ApplicationRecord
  # Increments the count and returns the next handle to be assigned
  # Uses pessimistic locking in case of concurrent requests: 
  # https://apidock.com/rails/v5.2.3/ActiveRecord/Locking/Pessimistic/with_lock
  def increment_count
    with_lock do
      self.count += 1
      save
      self.count - 1
    end
  end 
end