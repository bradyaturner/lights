class Command
  attr_reader :address, :method, :body
  def initialize(data = {})
    @address = data["address"]
    @body = data["body"]
    @method = data["method"]
    @data = data
  end

  def data
    data = @data
    data["address"] = @address if @address
    data["body"] = @body if @body
    data["method"] = @method if @method
    data
  end

  def to_json(options={})
    data.to_json
  end
end


