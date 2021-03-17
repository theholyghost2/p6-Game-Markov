use Game::Markov::TimeChain;
use Game::Markov::AbstractMarkovChain;

role MarkovP { method chanceA($A, @indices) { 
		### This calculates P(A|v_1,v_2,...,v_n)
		return 0;	
	}
};

class Game::Markov::MarkovChain is Game::Markov::TimeChain is AbstractMarkovChain does MarkovP {
	
	method BUILD(:$starttime, :$endtime, :@preprobs, :@postprobs) {

		.preprobabilities = @preprobs;
		.postprobabilities = @postprobs;

		.time = Time.new(startttime =>$ starttime, endtime => $endtime);

	}

}
