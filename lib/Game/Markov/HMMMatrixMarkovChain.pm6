use Game::Markov::MarkovChain;

use Game::Markov::TransitionProbabilityVector;
use Game::Markov::TransitionProbabilityMatrix;

### Vector based Chain (HMM == Hidden Markov Model)
### Matrix-wise forward and backward pass algorithm

class Game::Markov::HMMMatrixMarkovChain is Game::Markov::MarkovChain {

	### chain of vectors for passing through algorithm (back and forward
	### states :
	has @.prevectors;
	has @.postvectors;

	has @.alphas; ### 

	has $!trans-prob-matrix;	

	method BUILD(:$n, :$m, :@initmatrixvalues) {
		$!trans-prob-matrix = new Game::Markov::TransitionProbabilityMatrix($n,$m);	
		set-values(@initmatrixvalues);	
	}


	### generate time step $t, P(j)*bj(o1)
	multi method gen-alpha($t, $pj, $likelij) {
		push(.alphas, $pj*$likelij);
	}

	multi method set-values(@values) {
		$!trans-prob-matrix.set-values(@values);
	}

	method addPreVector($transpv) {
		push(.prevectors, $transpv);
		### self.time.tick(1); ### add one virtual second tick 
				   ### so that the chain is second-indexable
	}

	method addPostVector($transpv) {
		push(.postvectors, $transpv);
		###	self.time.tick(1); ### add one virtual second tick 
				   ### so that the chain is second-indexable
	}

}

