import utest.Assert;
import dotenv.Dotenv;
import utest.Test;

class TestAll extends Test {
	private var env = new Dotenv().load();

	function testFirstKey() {
		Assert.equals(env.get("FIRST"), "100");
	}

	function testSecondKey() {
		Assert.equals(env.get("SECOND"), "200");
	}
}
