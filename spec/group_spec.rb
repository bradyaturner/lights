require 'lights'

describe Group do
  it "properly parses input parameters" do
    data = JSON.parse(GROUPS_JSON)["1"]
    group = Group.new(1,data)
    group.id.should eql 1
    group.name.should eql "Ceiling light"
    group.type.should eql "LightGroup"
    group.lights.should eql ["1","2","3","4"]
  end

  it "properly reconstucts object hash" do
    data = JSON.parse(GROUPS_JSON)["1"]
    group = Group.new(1,data)
    group.id.should eql 1
    group.data.should eql data
  end
end

GROUPS_JSON = %Q{
{
  "1": {
    "name": "Ceiling light",
    "lights": [
      "1",
      "2",
      "3",
      "4"
    ],
    "type": "LightGroup",
    "action": {
      "on": true,
      "bri": 254,
      "hue": 56100,
      "sat": 232,
      "effect": "none",
      "xy": [
        0.4119,
        0.1949
      ],
      "ct": 293,
      "colormode": "xy"
    }
  },
  "2": {
    "name": "Lamp",
    "lights": [
      "5"
    ],
    "type": "LightGroup",
    "action": {
      "on": true,
      "bri": 254,
      "hue": 56100,
      "sat": 232,
      "effect": "none",
      "xy": [
        0.4119,
        0.1949
      ],
      "ct": 293,
      "colormode": "xy"
    }
  },
  "3": {
    "name": "HueCraft_Ambiance1",
    "lights": [
      "1",
      "2"
    ],
    "type": "LightGroup",
    "action": {
      "on": true,
      "bri": 254,
      "hue": 56100,
      "sat": 232,
      "effect": "none",
      "xy": [
        0.4119,
        0.1949
      ],
      "ct": 293,
      "colormode": "xy"
    }
  },
  "4": {
    "name": "HueCraft_Ambiance2",
    "lights": [
      "3",
      "4"
    ],
    "type": "LightGroup",
    "action": {
      "on": true,
      "bri": 254,
      "hue": 56100,
      "sat": 232,
      "effect": "none",
      "xy": [
        0.4119,
        0.1949
      ],
      "ct": 293,
      "colormode": "xy"
    }
  },
  "5": {
    "name": "HueCraft_Effect1",
    "lights": [
      "5"
    ],
    "type": "LightGroup",
    "action": {
      "on": true,
      "bri": 254,
      "hue": 56100,
      "sat": 232,
      "effect": "none",
      "xy": [
        0.4119,
        0.1949
      ],
      "ct": 293,
      "colormode": "xy"
    }
  },
  "6": {
    "name": "HueCraft_HueCraft",
    "lights": [
      "1",
      "2",
      "3",
      "4",
      "5"
    ],
    "type": "LightGroup",
    "action": {
      "on": true,
      "bri": 254,
      "hue": 56100,
      "sat": 232,
      "effect": "none",
      "xy": [
        0.4119,
        0.1949
      ],
      "ct": 293,
      "colormode": "xy"
    }
  }
}
}
