
### The Matrix of the Hidden Markov Model

class Game::Markov::TransitionProbabilityMatrix {

	has @!matrix-list;

	method BUILD(:$n, :$m) {

		loop (my $i = 0; $i < $n * $m; $i++) {
				push(@!matrix-list, 1 / rand);
		}

	}

}
