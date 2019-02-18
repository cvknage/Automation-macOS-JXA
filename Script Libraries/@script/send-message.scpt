JsOsaDAS1.001.00bplist00�Vscript_Sconst Script = (function() {
	const FileUtils = Library('FileUtils');
	const IftttUtils = Library('IftttUtils');	

	const enableSendMessage = true;
	const enableDeleteFile = true;

	return {
		run: function(input, parameters) {
			var Messages = Application('Messages');
			var Finder = Application("Finder")
			var app = Application.currentApplication();
			app.includeStandardAdditions = true;

			var fileContent = FileUtils.readTextFile(input.toString());
			var message = JSON.parse(fileContent);
			var messagingService = Messages.services[message.type];

			var date = IftttUtils.occuredAtDate(message.occuredAt);
			var shouldSend = shouldSendMessage(date, message.timeConstraints);
			if (shouldSend) {
				if (enableSendMessage) {
					Messages.send(message.message, {to: messagingService.buddies[message.to]});
				}
			}

			if (enableDeleteFile) {
				FileUtils.trashFile(input.toString());
			}

			return shouldSend ? `Sent message: [${message.message}] to: [${message.to}]` : `Didn't send message : [${message.message}] to: [${message.to}]`;
		}
	};

	function shouldSendMessage(occuredDate, timeConstraints) {
		if (!timeConstraints.enabled) {
			return true;
		}
		
		var shouldSend = true;
		for (var constraint of timeConstraints.constraints) {
			var constraintDate = new Date();
			if (constraint.month) { constraintDate.setMonth(constrainth.month - 1) }
			if (constraint.date) { constraintDate.setDate(constraint.date); }
			if (constraint.hours) { constraintDate.setHours(constraint.hours); }
			if (constraint.minutes) { constraintDate.setMinutes(constraint.minutes); }
			constraintDate.setSeconds(0);
			constraintDate.setMilliseconds(0);

			switch(constraint.operation) {
				case ">":
					if (constraintDate > occuredDate) {
						shouldSend = shouldSend && false;
					}
					break;
				case "<":
					if (constraintDate < occuredDate) {
						shouldSend = shouldSend && false;
					}
					break;
				case "=":
					if (occuredDate.getTime() !== constraintDate.getTime()) {
						shouldSend = shouldSend && false;
					}
					break;
			}
		}

		return shouldSend;
	}
})();

const run = Script.run;
                              i jscr  ��ޭ