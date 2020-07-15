import Foundation;

public class Game {
	public var players: [Player];
	public var message: MessageService

	public init() {
		self.message = MessageService();
		players = [];
	}

	private func generatePlayers() {
    message.selectNumberOfPlayersMessage();
		let names = readLine()!;
    let namesArray = names.components(separatedBy: " ")
    if(namesArray.count > 8 || namesArray.count<2 ) {
      message.wronglyEnteredNames();
		  generatePlayers();
	  } else {
        for name in namesArray {
			  self.players.append(Player(name));
		  }
    }
    
  }

	public func runGame() {
   message.helloMessage();
   generatePlayers();
   play()
	}

	private func play() {
		var haveWinner = false;
    var winnersIdx: Int = -1;
    while !haveWinner {
      for i in 0..<self.players.count {
        turn(i);
        if(isWinner(players[i])) {
          haveWinner = true;
          winnersIdx = i;
          break;
        }
      }
    }

    message.annaunceWinner(players[winnersIdx]);
		
	}

  private func turn(_ index: Int) {
    players[index].rollDices();
    
    if isTurnInvalid(players[index]) {
      players[index].invalidateCurrentTurn();
      message.lostTurnMessage(players[index]);
      return;
    }

    message.turnMessage(players[index]);
    message.selectTurn();
    operate(index);

  }

  private func operate(_ idx: Int) {
		let selectedTurn = readLine()!;
    if selectedTurn == "1" {
      turn(idx);
    } else if(selectedTurn == "2") {
      players[idx].finishTurn();
    }
  }

  private func isTurnInvalid(_ player: Player) -> Bool {
    return player.currentGuns >= 3;
  } 

	private func isWinner(_ player: Player) -> Bool {
		return player.brainPoints >= 13;
	}
}