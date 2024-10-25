-- This Source Code Form is subject to the terms of the bCDDL, v. 1.1.
-- If a copy of the bCDDL was not distributed with this
-- file, You can obtain one at http://beamng.com/bCDDL-1.1.txt


local M = {}

local cc_was_on = false

local function setBtnDown()
  log('D', 'betterCruiseControl', 'Set Button: Down')
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
  log('D', 'betterCruiseControl', 'Set Button: Up')
  local cc = extensions.use('cruiseControl')
  local cfg = cc.getConfiguration()
  local diffWhileHolding = (electrics.values.wheelspeed or 0) - cfg.targetSpeed
  if cc_was_on and diffWhileHolding > -1/3.6 and diffWhileHolding <= 0 then
    cc.changeSpeed(-1/3.6)
    cc.setEnabled(true)
  else
    cc.holdCurrentSpeed()
  end
end

local function resumeBtnDown()
  log('D', 'betterCruiseControl', 'Resume Button: Down')
  local cc = extensions.use('cruiseControl')
  local cfg = cc.getConfiguration()
  if cfg.isEnabled then
    cc.changeSpeed(1/3.6)
  else
    cc.setEnabled(true)
  end
end

local function cancelBtnDown()
  log('D', 'betterCruiseControl', 'Cancel Button: Down')
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
