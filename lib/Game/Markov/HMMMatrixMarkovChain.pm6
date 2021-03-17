use Game::Markov::MarkovChain;

### Vector based Chain (HMM == Hidden Markov Model)
### Matrix-wise forward and backward pass algorithm

class Game::Markov::HMMMatrixMarkovChain is Game::Markov::MarkovChain {

	### chain of vectors for passing through algorithm (back and forward
	### states :
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

