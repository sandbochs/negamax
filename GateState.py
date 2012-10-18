class __GameState:
  ALL_STATES = {}
  def __init__(self, value, prettyStr):
    self.value = value
    self.prettyStr = prettyStr
    GameState.ALL_STATES[self.value] = self
  def invert(self):
    return GameState.ALL_STATES[ 2 - self.value ]
  def __cmp__(self, other):
    return self.value - other.value
  def __str__(self):
    return self.prettyStr

WIN = __GameState(2, "WIN")
TIE = __GameState(1, "TIE")
LOSE = __GameState(0, "LOSE")
