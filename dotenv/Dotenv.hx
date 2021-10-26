package dotenv;

import sys.io.File;

class Dotenv {
	private var filepath:String;

	public function new(?filepath:String = ".env") {
		this.filepath = filepath;
	}

	public function load():Map<String, String> {
		var envContent = File.getContent(this.filepath);
		if (envContent.length == 0)
			return Sys.environment();

		var lines = envContent.split('\n');
		for (line in lines) {
			var i = 0, key = "", value = "", char = line.charAt(i);

			while (i < line.length) {
				if (char == '=') {
					char = line.charAt(++i);
					while (i < line.length) {
						value += char;
						char = line.charAt(++i);
					}
				} else {
					key += char;
				}
				char = line.charAt(++i);
			}
			if (key != "" && value != "")
				Sys.putEnv(key, value);
		}

		return Sys.environment();
	}

	public function getFilepath() {
		return this.filepath;
	}
}
