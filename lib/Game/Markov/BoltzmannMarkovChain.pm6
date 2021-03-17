use Game::Markov::MarkovChain;

### HMM using Maxwell-Boltzmann distribution for forward and backward pass

class Game::Markov::BoltzmannMarkovChain is Game::Markov::MarkovChain {

	has @.prevectors;
	has @.postvectors;

	method addPreVector($v) {
		push(@.prevectors, $v);
		### self.time.tick(1); ### add one virtual second tick 
				   ### so that the chain is second-indexable
	}

	method addPostVector($v) {
		push(@.postvectors, $v);
		###	self.time.tick(1); ### add one virtual second tick 
				   ### so that the chain is second-indexable
	}

}

