
### The States of the Hidden Markov Model

class Game::Markov::TransitionStates {

	has @!states;

	method BUILD(:@states) {

		@!states = @states;

	}

}
