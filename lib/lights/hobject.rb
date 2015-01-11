class HObject
  def initialize(*args)
  end

  def to_json(options={})
    data.to_json
  end
end

