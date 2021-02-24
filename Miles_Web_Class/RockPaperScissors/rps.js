
const Choices = {
  rock: 'rock',
  paper: 'paper',
  scissors: 'scissors'
}
const Stats = {
  player: 'player',
  computer: 'computer',
  tie: 'tie'
}

// Allow incorrect values with a default:
// function getRounds() {
//   let rounds = parseInt(prompt('How many rounds do you want to play?', '3'));
//   return (isNaN(rounds) || rounds < 3) ? 3 : rounds;
// }

// Do not allow incorrect values. Continue prompting until valid values are received:
function getRounds() {
  let rounds = parseInt(prompt('How many rounds do you want to play?'));
  while (isNaN(rounds) || rounds < 1) {
    rounds = getRounds();
  }
  return rounds;
}

function showStats(currentRound, playerWins, computerWins, ties) {
  console.log(`Round: ${currentRound}`);
  console.log(`Score: Player: ${playerWins}, Computer: ${computerWins}, Ties: ${ties}`);
}

// // Allow incorrect values with a default:
// function getPlayerChoice() {
//   let playerChoice = prompt("Choose 'Rock', 'Paper', or 'Scissors'", 'Rock')
//   playerChoice = playerChoice === null ? '' : playerChoice.toLowerCase();
//   return (playerChoice !== Choices.rock && playerChoice !== Choices.paper && playerChoice !== Choices.scissors) ? Choices.rock : playerChoice;
// }

// Do not allow incorrect values. Continue prompting until valid values are received:
function getPlayerChoice() {
  let playerChoice = prompt("Choose 'Rock', 'Paper', or 'Scissors'");
  playerChoice = playerChoice === null ? '' : playerChoice.toLowerCase();
  while (playerChoice === null || (playerChoice !== Choices.rock && playerChoice !== Choices.paper && playerChoice !== Choices.scissors)) {
    playerChoice = getPlayerChoice();
  }
  return playerChoice;
}

function getComputerChoice() {
  let computerChoice = Math.floor(Math.random() * 3) + 1;
  switch (computerChoice) {
    case 1:
      computerChoice = Choices.rock;
      break;
    case 2:
      computerChoice = Choices.paper;
      break;
    case 3:
      computerChoice = Choices.scissors;
      break;
  }
  return computerChoice;
}

function getWinner(playerChoice, computerChoice) {
  let winner = '';
  switch (playerChoice + computerChoice) {
    case Choices.rock + Choices.rock:
      winner = Stats.tie;
      break;
    case Choices.rock + Choices.paper:
      winner = Stats.computer;
      break;
    case Choices.rock + Choices.scissors:
      winner = Stats.player;
      break;
    case Choices.paper + Choices.paper:
      winner = Stats.tie;
      break;
    case Choices.paper + Choices.scissors:
      winner = Stats.computer;
      break;
    case Choices.paper + Choices.rock:
      winner = Stats.player;
      break;
    case Choices.scissors + Choices.scissors:
      winner = Stats.tie;
      break;
    case Choices.scissors + Choices.rock:
      winner = Stats.computer;
      break;
    case Choices.scissors + Choices.paper:
      winner = Stats.player;
      break;
  }
  return winner;
}

function showResults(playerChoice, computerChoice, winner) {
  console.log(`Player chose: ${playerChoice}, Computer chose: ${computerChoice} `);
  var message = (winner === Stats.tie) ? `result: ${winner}!` : `result: ${winner} wins!`
  console.log(message);
}

function gameOver(playerWins, computerWins, ties) {
  console.log(`Final Score: Player: ${playerWins}, Computer: ${computerWins}, Ties: ${ties}`);
}

function playGame() {
  let playerWins = 0,
    computerWins = 0,
    ties = 0,
    rounds = getRounds();

  for (let i = 1; i <= rounds; i++) {

    showStats(i, playerWins, computerWins, ties);

    var playerChoice = getPlayerChoice();
    var computerChoice = getComputerChoice();
    var winner = getWinner(playerChoice, computerChoice);

    switch (winner) {
      case Stats.player:
        playerWins++;
        break;
      case Stats.computer:
        computerWins++;
        break;
      case Stats.tie:
        ties++;
        break;
    }
    showResults(playerChoice, computerChoice, winner);
  }
  gameOver(playerWins, computerWins, ties);
}

