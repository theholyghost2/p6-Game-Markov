use Game::Markov::TimeChain;

### Non-vector based Chain

class Game::Markov::MarkovChain is Game::Markov::TimeChain {
	
	method BUILD(:@timebasedvars) {

		$.time = Time.new(startttime => 0, endtime => @timebasedvars.elems);
		(@.timedata = @timebasedvars) unless (not @timebasedvars) {
				@timebasedvars; }; ### markov chain vectors

	}

	method add($v) {
		push (@.timedata, $v);
	}

}
