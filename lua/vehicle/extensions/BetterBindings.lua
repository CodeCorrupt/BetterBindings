local M = {}

local cc_was_on = false
local ONE_MPH = 0.44704

local function setBtnDown()
  local cc = extensions.use('cruiseControl')
  local cfg = cc.getConfiguration()
  if cfg.isEnabled then
    cc_was_on = true
    cc.setEnabled(false)
  else
    cc_was_on = false
  end
end

local function setBtnUp()
  local cc = extensions.use('cruiseControl')
  local cfg = cc.getConfiguration()
  local diffWhileHolding = (electrics.values.wheelspeed or 0) - cfg.targetSpeed
  if cc_was_on and diffWhileHolding > -ONE_MPH and diffWhileHolding <= 0 then
    cc.changeSpeed(-1/3.6)
    cc.setEnabled(true)
  else
    cc.holdCurrentSpeed()
  end
end

local function resumeBtnDown()
  local cc = extensions.use('cruiseControl')
  local cfg = cc.getConfiguration()
  if cfg.isEnabled then
    cc.changeSpeed(1/3.6)
  else
    cc.setEnabled(true)
  end
end

local function cancelBtnDown()
  local cc = extensions.use('cruiseControl')
  cc.setEnabled(false)
end

local function toggleEnableBtnDown()
  local cc = extensions.use('cruiseControl')
  local cfg = cc.getConfiguration()
  cc.setEnabled(not cfg.isEnabled)
end

M.setBtnDown = setBtnDown
M.setBtnUp = setBtnUp
M.resumeBtnDown = resumeBtnDown
M.cancelBtnDown = cancelBtnDown
M.toggleEnableBtnDown = toggleEnableBtnDown

return M
