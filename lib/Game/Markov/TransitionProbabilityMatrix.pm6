
### The Matrix of the Hidden Markov Model

class Game::Markov::TransitionProbabilityMatrix {

	has @!matrix-list;
	has $!rows;
	has $!cols;

	method BUILD(:$n, :$m) {

		loop (my $i = 0; $i < $n * $m; $i++) {
				push(@!matrix-list, 1 / rand);
		}

		$!rows = $m;
		$!cols = $n;

	}


	multi method set-values(@values) {
		loop ($i = 0; $i < $!rows*$!cols; $i++) {
			@!matrix-list[$i] = @values[$i];
		}

	}

	multi method set-nm($n, $m, $value) {
		$i = 0;
		loop (; $i < $m+$n*$!rows - 1; $i++)
	       		;

		@!matrix-list[$i] = $value;
	}	
		
}
