
localnode = {
  model = 'Keithley',
  linefreq = 100
}

status = {
  operation = {
    sweeping = {
      condition = -1
    }
  }
}

trigger = {
  blender = {
    [1]={EVENT_ID = 1, stimulus = {}},
    [2]={stimulus = {}},
  },
  EVENT_ID = 1
}

display = {
  smua = {
    measure = {}
  },
  smub = {
    measure = {}
  },
  MEASURE_DCAMPS = 1
}

smua = {
  nvbuffer1 = {
    readings = {}
  },
  nvbuffer2 = {
    readings = {}
  },
  trigger = {
    endpulse = {},
    source = {},
    arm = {},
    measure = {},
    endsweep = {},
    MEASURE_COMPLETE_EVENT_ID = 1,
    ARMED_EVENT_ID = 1,
    PULSE_COMPLETE_EVENT_ID = 1,
    SOURCE_COMPLETE_EVENT_ID = 1
  },
  source = {},
  measure = {},
  ENABLE = 1,
  OUTPUT_ON = 1,
  SENSE_LOCAL = 1,
  AUTORANGE_ON = 1,
  OUTPUT_DCVOLTS = 1,
}

smub = {
  nvbuffer1 = {
    readings = {}
  },
  nvbuffer2 = {
    readings = {}
  },
  trigger = {
    endpulse = {},
    source = {},
    arm = {},
    measure = {},
    endsweep = {},
    MEASURE_COMPLETE_EVENT_ID = 1,
    ARMED_EVENT_ID = 1,
    PULSE_COMPLETE_EVENT_ID = 1,
    SOURCE_COMPLETE_EVENT_ID = 1
  },
  source = {},
  measure = {},
  ENABLE = 1,
  OUTPUT_ON = 1,
  SENSE_LOCAL = 1,
  AUTORANGE_ON = 1,
  OUTPUT_DCVOLTS = 1,
}

beeper = {}

dummy = {}

function smua.trigger.measure.iv(buffer1, buffer2)
  return 5
end

function smua.trigger.source.linearv(start, stop, steps)
  if start == stop then
    dummy.Vdrain = start
  else
    i = 0
    steps = (stop - start) / steps
    for var=start,stop,steps do
      smua.nvbuffer1.readings[i] = var
      smua.nvbuffer2.readings[i] = var

      smub.nvbuffer1.readings[i] = var
      smub.nvbuffer2.readings[i] = var

      i = i+1
    end

    smua.nvbuffer1.n = #smua.nvbuffer1.readings
    smua.nvbuffer2.n = #smua.nvbuffer2.readings

    smub.nvbuffer1.n = #smub.nvbuffer1.readings
    smub.nvbuffer2.n = #smub.nvbuffer2.readings
  end

  return 1
end

function smub.trigger.source.linearv(start, stop, steps)
  if start == stop then
    dummy.Vdrain = start
  else
    i = 0
    steps = (stop - start) / steps
    for var=start,stop,steps do
      smua.nvbuffer1.readings[i] = var
      smua.nvbuffer2.readings[i] = var

      smub.nvbuffer1.readings[i] = var
      smub.nvbuffer2.readings[i] = var

      i = i+1
    end

    smua.nvbuffer1.n = #smua.nvbuffer1.readings
    smua.nvbuffer2.n = #smua.nvbuffer2.readings

    smub.nvbuffer1.n = #smub.nvbuffer1.readings
    smub.nvbuffer2.n = #smub.nvbuffer2.readings
  end

  return 1
end


function smub.trigger.source.listv(mylist)
  smua.trigger.source.listv(mylist)
end

function smua.trigger.source.listv(mylist)
  if mylist[1]== mylist[2] then
    dummy.Vdrain = mylist[1]
  else
    for index, value in ipairs(mylist) do
      smua.nvbuffer1.readings[index] = value
      smua.nvbuffer2.readings[index] = value

      smub.nvbuffer1.readings[index] = value
      smub.nvbuffer2.readings[index] = value
    end

    smua.nvbuffer1.n = #smua.nvbuffer1.readings
    smua.nvbuffer2.n = #smua.nvbuffer2.readings

    smub.nvbuffer1.n = #smub.nvbuffer1.readings
    smub.nvbuffer2.n = #smub.nvbuffer2.readings
  end
  return 1
end

function smua.trigger.initiate()
  return 1
end

function smua.nvbuffer1.clear()
  return 1
end
function smua.nvbuffer1.clearcache()
  return 1
end

function smua.nvbuffer2.clear()
  return 1
end
function smua.nvbuffer2.clearcache()
  return 1
end

function smub.trigger.measure.iv(buffer1, buffer2)
  return 1
end

function smub.trigger.initiate()
  return 1
end

function smub.nvbuffer1.clear()
  return 1
end

function smub.nvbuffer1.clearcache()
  return 1
end

function smub.nvbuffer2.clear()
  return 1
end

function smub.nvbuffer2.clearcache()
  return 1
end

function reset()
  return 1
end

function beeper.beep(a, b)
  return 1
end

