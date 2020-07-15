public enum DiceSide {
  case Brain
  case Step
  case Gun
}
public protocol Dice {
  var sides: [DiceSide] {
    get
  };

  func roll() -> DiceSide;
}

public class GreenDice: Dice {
  public let sides: [DiceSide];
  static var type: String = "Green Dice"

  public init() {
    self.sides = [DiceSide.Brain,DiceSide.Brain, DiceSide.Brain, DiceSide.Step, DiceSide.Step, DiceSide.Gun ];
  }

  public func roll() -> DiceSide {
    return sides.randomElement()!;
  }
}

public class YellowDice: Dice {
  public let sides: [DiceSide];
  static var type = "Yellow Dice"
  public init() {
    self.sides = [DiceSide.Brain, DiceSide.Brain, DiceSide.Step, DiceSide.Step, DiceSide.Gun, DiceSide.Gun ];
  }

  public func roll() -> DiceSide {
    return sides.randomElement()!;
  }
}

public class RedDice: Dice {
  public let sides: [DiceSide];
  static var type: String = "Red Dice";

  public init() {
    self.sides = [DiceSide.Brain, DiceSide.Brain, DiceSide.Step, DiceSide.Step, DiceSide.Gun, DiceSide.Gun ];
  }

  public func roll() -> DiceSide {
    return sides.randomElement()!;
  }
}

public class DiceFactory {
  public init(){}

  private func generateDice(color colorLiteral:String) -> Dice {
    switch colorLiteral {
    case "red":
      return RedDice();
    case "yellow":
      return YellowDice();
    default:
      return RedDice();   
    }
  }

  public func generateDices(greenDices green:Int, yellowDices yellow:Int, redDices red:Int) -> [Dice] {
    var result: [Dice] = [];
    for _ in 1...red {
      result.append(generateDice(color: "red"));
    }
    for _ in 1...yellow {
      result.append(generateDice(color: "yellow"));
    }
    for _ in 1...green {
      result.append(generateDice(color: "green"));
    }
    return result;
  }
}

public class DiceRoller {
  public var usedDices: [Dice]; //  dices to be used during players' turns
  var dices: [Dice]; // set of dices
  var taken: [Dice]; // dices that are going to be thrown
  public init () {
    let factory = DiceFactory();
    self.dices = factory.generateDices(greenDices: 6, yellowDices: 4, redDices:2);
    self.taken = [];
    self.usedDices = [];
  }

  func pickDice() {
    let index = Int.random(in: 0..<dices.count);
    print("index problem \(index)");
    let dice = self.dices[index];
    self.dices.remove(at: index);
    self.taken.append(dice)
  }

  public func rollDices()-> [DiceSide] {
    pickDices();
    var result: [DiceSide] = [];
    for dice in self.taken {
      let diceSide = dice.roll();
      if(diceSide != DiceSide.Step) {
        self.usedDices.append(dice);
        result.append(diceSide);
      } 
    }

    return result;
    
  }

  public func reset() {
    for dice in self.usedDices {
      self.dices.append(dice);
    }
    
    self.usedDices = [];
  }

  func pickDices() {
    for _ in 0..<(3 - taken.count) {
      self.pickDice();
    }
  }
}