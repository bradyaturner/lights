class HObject
  def initialize(data={})
    @data = data
  end

  def to_json(options={})
    data.to_json
  end
end

