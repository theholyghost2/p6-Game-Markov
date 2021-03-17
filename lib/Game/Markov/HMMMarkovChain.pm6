use Game::Markov::MarkovChain;

### best, middle, worst case scenarios

class Game::Markov::HMMMarkovChain is Game::Markov::MarkovChain {
	
	### This calculates P(A|v_1,v_2,...,v_n) with @indices in .timedata
	method chance($A, @indices) {
		return self.chanceA($A, @indices);
	}

}
