public class MessageService {
	public func helloMessage() {
		print("Welcome to Zombie Dice!!!")
	}

  public func printTable(_ players: [Player]) {
    for player in players {
      print("Player \(player.name) has \(player.brainPoints) points");
    }
  } 

	public func selectNumberOfPlayersMessage() {
		print("Enter players names separeted with space");
	}

  public func wronglyEnteredNames() {
    print("There should be 2-8 names");
  }

  public func turnMessage(_ player: Player) {
    print("\(player.name) currently gained \(player.currentBrains) brains and \(player.currentGuns) guns");
  }

  public func selectTurn() {
    print("1. Roll Dices");
    print ("2. Finish Turn");
  }

  public func annaunceWinner(_ player: Player) {
    print("\(player.name) has won");
  }

  public func lostTurnMessage(_ player: Player) {
    print("\(player.name) has lost all of the points gained during current turn");
  }

}
