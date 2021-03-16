use Game::Stats::Probability;

### The probabilites of the Hidden Markov Model
#
### It is important that the sum of these probabilities is 1

class Game::Markov::TransitionProbabilities {

	has @!probabilities;

	method BUILD() {  ### list of numbers
	}

	### e.g. my $tn = TransitionProbabilities.new;
	###      $tn.init($tn.generate-list-of-random-chances);
	method init(:@ps) {  ### list of numbers


		loop (my $i = 0; $i < @ps.elems; $i++) {
			push(@!probabilities, Game::Stats::Probability.new( xpop => @ps[$i]));
		}

	}

	### generate a list of p(i) with Sigma(p(i)) = 1
	multi method generate-list-of-random-chances {
		my $threshold = 0.0000000001; ### FIXME

		return self.generate-random-chances($threshold);
	}

	### generate a list of p(i) with Sigma(p(i)) = 1 with threshold
	multi method generate-list-of-random-chances($threshold) {
		my $extra = 1;
		my @ps;
	

		while ($extra > $threshold) { 
			my $p = 1 / rand;

			$extra -= $p;
			push(@ps, $p);
		}
		
		return @ps;	
	}

}
