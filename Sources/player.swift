import Foundation;

public class Player {
  let _name: String;
  
  private var _brainPoints: Int;
  private let _diceRoller: DiceRoller;

  public var name: String {
    get {
      return _name
    }
  }

  public var brainPoints: Int {
    get {
      return _brainPoints;
    }
    set(newBrainPoints) {
      if newBrainPoints >= 0 {
        self._brainPoints = newBrainPoints
      }
    }
  }

  public func rollDices() {
    let diceSides = _diceRoller.rollDices();
    for side in diceSides {
      if side == DiceSide.Brain {
        self.currentBrains += 1;
      }
      
      if side == DiceSide.Gun {
        self.currentGuns += 1;
      }
    }
  }

  public func invalidateCurrentTurn() {
    self.currentBrains = 0;
    self.currentGuns = 0;
    self._diceRoller.reset();
  }

  public func finishTurn() {
    self.brainPoints += self.currentBrains;
    self.currentBrains = 0;
    self.currentGuns = 0;
    self._diceRoller.reset();
  }

  var currentGuns: Int;
  var currentBrains: Int;

  public init(_ name: String) {
  
    self._name = name;
    self._diceRoller = DiceRoller();
    self._brainPoints = 0;
    self.currentGuns = 0;
    self.currentBrains = 0;
  }
}
