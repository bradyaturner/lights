require 'lights'

describe Datastore do
  it "properly reconstructs sub objects" do
    data = JSON.parse(DATASTORE_JSON)
    ds = Datastore.new data
    ds.lights.data.should eql data["lights"]
    ds.groups.data.should eql data["groups"]
    ds.rules.data.should eql data["rules"]
    ds.scenes.data.should eql data["scenes"]
    ds.schedules.data.should eql data["schedules"]
    ds.sensors.data.should eql data["sensors"]
    ds.data.should eql data
  end
end

DATASTORE_JSON = %Q{
{
  "lights": {
    "1": {
      "state": {
        "on": true,
        "bri": 254,
        "hue": 34495,
        "sat": 232,
        "effect": "none",
        "xy": [
          0.3151,
          0.3251
        ],
        "ct": 155,
        "alert": "none",
        "colormode": "xy",
        "reachable": true
      },
      "type": "Extended color light",
      "name": "Hue Lamp 1",
      "modelid": "LCT001",
      "uniqueid": "00:17:88:01:00:aa:bb:cb-0b",
      "swversion": "66013452",
      "pointsymbol": {
        "1": "0a00f1f01f1f1001f1ff100000000001f2000000",
        "2": "none",
        "3": "none",
        "4": "none",
        "5": "none",
        "6": "none",
        "7": "none",
        "8": "none"
      }
    },
    "2": {
      "state": {
        "on": true,
        "bri": 254,
        "hue": 34495,
        "sat": 232,
        "effect": "none",
        "xy": [
          0.3151,
          0.3251
        ],
        "ct": 155,
        "alert": "none",
        "colormode": "xy",
        "reachable": true
      },
      "type": "Extended color light",
      "name": "Hue Lamp 2",
      "modelid": "LCT001",
      "uniqueid": "00:17:88:01:00:aa:bb:ca-0b",
      "swversion": "66013452",
      "pointsymbol": {
        "1": "0a00f1f01f1f1001f1ff100000000001f2000000",
        "2": "none",
        "3": "none",
        "4": "none",
        "5": "none",
        "6": "none",
        "7": "none",
        "8": "none"
      }
    },
    "3": {
      "state": {
        "on": true,
        "bri": 254,
        "hue": 34495,
        "sat": 232,
        "effect": "none",
        "xy": [
          0.3151,
          0.3251
        ],
        "ct": 155,
        "alert": "none",
        "colormode": "xy",
        "reachable": true
      },
      "type": "Extended color light",
      "name": "Hue Lamp 3",
      "modelid": "LCT001",
      "uniqueid": "00:17:88:01:00:aa:bb:c9-0b",
      "swversion": "66013452",
      "pointsymbol": {
        "1": "0a00f1f01f1f1001f1ff100000000001f2000000",
        "2": "none",
        "3": "none",
        "4": "none",
        "5": "none",
        "6": "none",
        "7": "none",
        "8": "none"
      }
    },
    "4": {
      "state": {
        "on": true,
        "bri": 254,
        "hue": 34495,
        "sat": 232,
        "effect": "none",
        "xy": [
          0.3151,
          0.3251
        ],
        "ct": 155,
        "alert": "none",
        "colormode": "xy",
        "reachable": true
      },
      "type": "Extended color light",
      "name": "Hue Lamp 4",
      "modelid": "LCT001",
      "uniqueid": "00:17:88:01:00:aa:bb:c8-0b",
      "swversion": "66013452",
      "pointsymbol": {
        "1": "none",
        "2": "none",
        "3": "none",
        "4": "none",
        "5": "none",
        "6": "none",
        "7": "none",
        "8": "none"
      }
    },
    "5": {
      "state": {
        "on": true,
        "bri": 254,
        "hue": 34495,
        "sat": 232,
        "effect": "none",
        "xy": [
          0.3151,
          0.3251
        ],
        "ct": 155,
        "alert": "select",
        "colormode": "xy",
        "reachable": true
      },
      "type": "Extended color light",
      "name": "BT Lamp",
      "modelid": "LCT001",
      "uniqueid": "00:17:88:01:00:aa:bb:c7-0b",
      "swversion": "66013452",
      "pointsymbol": {
        "1": "none",
        "2": "none",
        "3": "none",
        "4": "none",
        "5": "none",
        "6": "none",
        "7": "none",
        "8": "none"
      }
    }
  },
  "groups": {
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
        "hue": 34495,
        "sat": 232,
        "effect": "none",
        "xy": [
          0.3151,
          0.3251
        ],
        "ct": 155,
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
        "hue": 34495,
        "sat": 232,
        "effect": "none",
        "xy": [
          0.3151,
          0.3251
        ],
        "ct": 155,
        "colormode": "xy"
      }
    }
  },
  "config": {
    "name": "Philips hue",
    "zigbeechannel": 25,
    "mac": "00:11:22:33:44:55",
    "dhcp": true,
    "ipaddress": "192.168.1.27",
    "netmask": "255.255.255.0",
    "gateway": "192.168.1.1",
    "proxyaddress": "none",
    "proxyport": 0,
    "UTC": "2015-01-01T00:11:24",
    "localtime": "2014-12-31T19:11:24",
    "timezone": "America/New_York",
    "whitelist": {
      "testuser1": {
        "last use date": "2015-01-01T00:11:24",
        "create date": "2014-12-30T20:05:07",
        "name": "lights"
      },
      "test user 2": {
        "last use date": "2014-05-26T14:20:54",
        "create date": "2013-08-03T17:05:51",
        "name": "unofficial hue app for osx"
      },
      "test user 3": {
        "last use date": "2014-12-31T02:19:57",
        "create date": "2013-08-03T18:48:19",
        "name": "test user"
      }
    },
    "swversion": "01018228",
    "apiversion": "1.5.0",
    "swupdate": {
      "updatestate": 0,
      "checkforupdate": false,
      "devicetypes": {
        "bridge": false,
        "lights": [

        ]
      },
      "url": "",
      "text": "",
      "notify": false
    },
    "linkbutton": false,
    "portalservices": true,
    "portalconnection": "connected",
    "portalstate": {
      "signedon": true,
      "incoming": true,
      "outgoing": true,
      "communication": "disconnected"
    }
  },
  "schedules": {
    "6033895564917352": {
      "name": "Alarm",
      "description": "Energize",
      "command": {
        "address": "/api/8Wc85V5IrG0XTHfB/groups/0/action",
        "body": {
          "scene": "d942060b6-on-5"
        },
        "method": "PUT"
      },
      "localtime": "W124/T06:40:00",
      "time": "W124/T11:40:00",
      "created": "2014-09-18T02:54:16",
      "status": "disabled"
    },
    "0326522980291031": {
      "name": "Alarm",
      "description": "",
      "command": {
        "address": "/api/8Wc85V5IrG0XTHfB/groups/0/action",
        "body": {
          "scene": "19a493ad2-off-0"
        },
        "method": "PUT"
      },
      "localtime": "W124/T07:45:00",
      "time": "W124/T12:45:00",
      "created": "2014-09-09T01:13:57",
      "status": "enabled"
    }
  },
  "scenes": {
    "fd0ceaedb-on-0": {
      "name": "Purple and Green",
      "lights": [
        "1",
        "2",
        "3",
        "4",
        "5"
      ],
      "active": true
    },
    "da01b1eaf-on-0": {
      "name": "Purple on 0",
      "lights": [
        "1",
        "2",
        "3",
        "4",
        "5"
      ],
      "active": true
    },
    "182a404bb-on-0": {
      "name": "Deck flower on 0",
      "lights": [
        "1",
        "2",
        "3",
        "4",
        "5"
      ],
      "active": true
    },
    "8fc639a85f-on-0": {
      "name": "Reading on 0",
      "lights": [
        "5"
      ],
      "active": true
    },
    "fedd8e5db-on-0": {
      "name": "Dark red on 0",
      "lights": [
        "1",
        "2",
        "3",
        "4",
        "5"
      ],
      "active": true
    }
  },
  "rules": {
    "1": {
      "name": "Tap 2.3 Reading",
      "owner": "8Wc85V5IrG0XTHfB",
      "created": "2014-09-17T23:34:25",
      "lasttriggered": "2014-12-31T03:29:37",
      "timestriggered": 10,
      "status": "enabled",
      "conditions": [
        {
          "address": "/sensors/2/state/buttonevent",
          "operator": "eq",
          "value": "17"
        },
        {
          "address": "/sensors/2/state/lastupdated",
          "operator": "dx"
        }
      ],
      "actions": [
        {
          "address": "/groups/0/action",
          "method": "PUT",
          "body": {
            "scene": "dc8a6e2b5-on-0"
          }
        }
      ]
    },
    "2": {
      "name": "Tap 2.1 All lights off",
      "owner": "8Wc85V5IrG0XTHfB",
      "created": "2014-07-16T20:43:43",
      "lasttriggered": "2014-12-31T06:29:46",
      "timestriggered": 12,
      "status": "enabled",
      "conditions": [
        {
          "address": "/sensors/2/state/buttonevent",
          "operator": "eq",
          "value": "34"
        },
        {
          "address": "/sensors/2/state/lastupdated",
          "operator": "dx"
        }
      ],
      "actions": [
        {
          "address": "/groups/0/action",
          "method": "PUT",
          "body": {
            "scene": "19a493ad2-off-0"
          }
        }
      ]
    },
    "3": {
      "name": "Tap 2.4 Purple",
      "owner": "8Wc85V5IrG0XTHfB",
      "created": "2014-07-19T16:32:31",
      "lasttriggered": "none",
      "timestriggered": 0,
      "status": "enabled",
      "conditions": [
        {
          "address": "/sensors/2/state/buttonevent",
          "operator": "eq",
          "value": "18"
        },
        {
          "address": "/sensors/2/state/lastupdated",
          "operator": "dx"
        }
      ],
      "actions": [
        {
          "address": "/groups/0/action",
          "method": "PUT",
          "body": {
            "scene": "da01b1eaf-on-0"
          }
        }
      ]
    },
    "4": {
      "name": "Tap 2.2 Energize",
      "owner": "8Wc85V5IrG0XTHfB",
      "created": "2014-07-16T20:43:43",
      "lasttriggered": "2014-12-31T21:42:04",
      "timestriggered": 9,
      "status": "enabled",
      "conditions": [
        {
          "address": "/sensors/2/state/buttonevent",
          "operator": "eq",
          "value": "16"
        },
        {
          "address": "/sensors/2/state/lastupdated",
          "operator": "dx"
        }
      ],
      "actions": [
        {
          "address": "/groups/0/action",
          "method": "PUT",
          "body": {
            "scene": "d942060b6-on-0"
          }
        }
      ]
    }
  },
  "sensors": {
    "1": {
      "state": {
        "daylight": false,
        "lastupdated": "none"
      },
      "config": {
        "on": true,
        "long": "none",
        "lat": "none",
        "sunriseoffset": 30,
        "sunsetoffset": -30
      },
      "name": "Daylight",
      "type": "Daylight",
      "modelid": "PHDL00",
      "manufacturername": "Philips",
      "swversion": "1.0"
    },
    "2": {
      "state": {
        "buttonevent": 16,
        "lastupdated": "2014-12-31T21:42:04"
      },
      "config": {
        "on": true
      },
      "name": "Hue Tap 1",
      "type": "ZGPSwitch",
      "modelid": "ZGPSWITCH",
      "manufacturername": "Philips",
      "uniqueid": "00:00:00:00:00:aa:bb:cc-f2"
    }
  }
}
}
