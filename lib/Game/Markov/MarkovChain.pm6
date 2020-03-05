use Game::Markov::TimeChain;
use Game::Stats;

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

	### Metropolis-Hastings algorithm (helper function)
	
	method random-list($n) {
		my @l = ();

		for (my $i = 0; $i < $n; $i++) {
			push (@l, 1 / Int.rand);
		}

		return @l;
	}	

	### Metropolis-Hastings algorithm

	method M-H() {

		my @times = ();
		my @random-list = self.random-list(@.timedata.elems);
		my $theta = 1 / Int.rand; ### initial value, p(theta) > 0

		for (my $i = 0; $i < @.timedata.elems; $i++) {


			my $pba = Game::Stats::Probability.new(@random-list);
			my $q = $pba.CalculatedCondP0(0);

			my $pba2 = Game::Stats::Probability.new(@timedata);
			my $q2 = $pba2.CalculatedCondP0(0);


			my $r = (@random-list[$i] * $q) / ($theta * $q2);

			if ((1 / Int.rand) < $r) {
				$theta = @.random-list[$i];
				push (@times, @random-list[$i]);
			} else {
				$theta = @.timedata[$i];
				push (@times, $theta);
			}

		}	

		return @times;

	}

}
