import utest.ui.Report;
import utest.Runner;

class Main {
	public static function main() {
		var runner = new Runner();

		runner.addCase(new TestAll());
		Report.create(runner);
		runner.run();
	}
}
