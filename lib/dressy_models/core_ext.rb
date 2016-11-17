Object.class_eval do
  def decorated?
    false
  end

  def undecorate
    self
  end
end
