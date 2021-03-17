use Game::Markov::TimeChain;

### The following makes a MarkovChain abstract
role MarkovP { method chanceA($A, @indices) { 
		### This calculates P(A|v_1,v_2,...,v_n)
			say "MarkovP, MarkovChain : Subclass responsability";
			return 0;	
	}
};

class Game::Markov::AbstractMarkovChain does MarkovP {

	has @.preprobabilities;
	has @.postprobabilities;

	method BUILD(:@preprobs, :@postprobs) {

		.preprobabilities = @preprobs;
		.postprobabilities = @postprobs;

	}


	### abstract method, @indices are the indices of @.timedata
	method chance($A, @indices) {
		return self.chanceA($A, @indices);
	}

}
