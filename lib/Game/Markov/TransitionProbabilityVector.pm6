
### The Vector of the Hidden Markov Model

class Game::Markov::TransitionProbabilityVector {

	has @!vector;

	method BUILD(:@ps) {

	}

	method set($n, $e) {
		self.set-nth($n, $e);
	}

	method nth($n) {
		return @!vector[$n];
	}

	method set-nth($n, $e) {
		@!vector[$n] = $e;
	}

	method norm {

		my $sum = 0;

		loop (my $i = 0; $i < @!vector.elems; $i++) {

			$sum += @!vector[$i] * @!vector[$i];

		}

		return $sum;
	}

	method dotp($v) {

		my $sum = 0;

		loop (my $i = 0; $i < @!vector.elems; $i++) {

			$sum += @!vector[$i] * $v.nth($i);

		}

		return $sum;
	}

}
