"use strict";
require("typings-global");
const beautylog_log_helpers_1 = require("./beautylog.log.helpers");
/**
 * logs an info to console
 * @param logText
 * @returns {boolean}
 */
exports.log = (logText) => {
    return beautylog_log_helpers_1.internalLog("log", logText);
};
exports.info = (logText) => {
    return beautylog_log_helpers_1.internalLog('info', logText);
};
/**
 * logs an 'OK!' message to console
 * @param logText
 * @returns {boolean}
 */
exports.ok = (logText) => {
    return beautylog_log_helpers_1.internalLog("ok", logText);
};
/**
 * logs a success to console
 * @param logText string to log as error
 * @returns {boolean}
 */
exports.success = (logText) => {
    return beautylog_log_helpers_1.internalLog("success", logText);
};
/**
 * logs a 'warn:' message to console
 * @param logText string to log as error
 * @returns {boolean}
 */
exports.warn = (logText) => {
    return beautylog_log_helpers_1.internalLog("warn", logText);
};
/**
 * logs an error to console
 * @param logText
 * @returns {boolean}
 */
exports.error = (logText) => {
    return beautylog_log_helpers_1.internalLog("error", logText);
};
/**
 * logs an directory to console
 * @param logText
 * @returns {boolean}
 */
exports.dir = (logText) => {
    return beautylog_log_helpers_1.internalLog("dir", logText);
};
/**
 * creates a new empty line
 * @param linesArg
 * @returns void
 */
exports.newLine = (linesArg = 1) => {
    for (let i = 0; i < linesArg; i++) {
        console.log("\n");
    }
};
/**
 * logs a reduced log that only logs changes of consequential log messages
 */
exports.logReduced = (logTextArg, repeatEveryTimesArg = 0) => {
    if (logTextArg == previousMessage && (repeatEveryTimesArg == 0 || sameMessageCounter != repeatEveryTimesArg)) {
        sameMessageCounter++;
    }
    else {
        sameMessageCounter = 0;
        previousMessage = logTextArg;
        exports.log(logTextArg);
    }
};
let previousMessage = "";
let sameMessageCounter = 0;
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiYmVhdXR5bG9nLmxvZy5qcyIsInNvdXJjZVJvb3QiOiIiLCJzb3VyY2VzIjpbIi4uL3RzL2JlYXV0eWxvZy5sb2cudHMiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6IjtBQUFBLFFBQU8sZ0JBQWdCLENBQUMsQ0FBQTtBQUV4Qix3Q0FBMEIseUJBQXlCLENBQUMsQ0FBQTtBQUVwRDs7OztHQUlHO0FBRVEsV0FBRyxHQUFHLENBQUMsT0FBTztJQUNyQixNQUFNLENBQUMsbUNBQVcsQ0FBQyxLQUFLLEVBQUMsT0FBTyxDQUFDLENBQUE7QUFDckMsQ0FBQyxDQUFBO0FBRVUsWUFBSSxHQUFHLENBQUMsT0FBTztJQUN0QixNQUFNLENBQUMsbUNBQVcsQ0FBQyxNQUFNLEVBQUMsT0FBTyxDQUFDLENBQUM7QUFDdkMsQ0FBQyxDQUFDO0FBRUY7Ozs7R0FJRztBQUNRLFVBQUUsR0FBRyxDQUFDLE9BQU87SUFDcEIsTUFBTSxDQUFDLG1DQUFXLENBQUMsSUFBSSxFQUFDLE9BQU8sQ0FBQyxDQUFDO0FBQ3JDLENBQUMsQ0FBQztBQUVGOzs7O0dBSUc7QUFDUSxlQUFPLEdBQUcsQ0FBQyxPQUFPO0lBQ3pCLE1BQU0sQ0FBQyxtQ0FBVyxDQUFDLFNBQVMsRUFBQyxPQUFPLENBQUMsQ0FBQztBQUMxQyxDQUFDLENBQUM7QUFFRjs7OztHQUlHO0FBQ1EsWUFBSSxHQUFHLENBQUMsT0FBTztJQUN0QixNQUFNLENBQUMsbUNBQVcsQ0FBQyxNQUFNLEVBQUMsT0FBTyxDQUFDLENBQUM7QUFDdkMsQ0FBQyxDQUFDO0FBRUY7Ozs7R0FJRztBQUNRLGFBQUssR0FBRyxDQUFDLE9BQU87SUFDdkIsTUFBTSxDQUFDLG1DQUFXLENBQUMsT0FBTyxFQUFDLE9BQU8sQ0FBQyxDQUFDO0FBQ3hDLENBQUMsQ0FBQztBQUVGOzs7O0dBSUc7QUFDUSxXQUFHLEdBQUcsQ0FBQyxPQUFPO0lBQ3JCLE1BQU0sQ0FBQyxtQ0FBVyxDQUFDLEtBQUssRUFBQyxPQUFPLENBQUMsQ0FBQztBQUN0QyxDQUFDLENBQUM7QUFFRjs7OztHQUlHO0FBQ1EsZUFBTyxHQUFHLENBQUMsUUFBUSxHQUFVLENBQUM7SUFDckMsR0FBRyxDQUFBLENBQUMsSUFBSSxDQUFDLEdBQUcsQ0FBQyxFQUFFLENBQUMsR0FBRyxRQUFRLEVBQUMsQ0FBQyxFQUFFLEVBQUMsQ0FBQztRQUM3QixPQUFPLENBQUMsR0FBRyxDQUFDLElBQUksQ0FBQyxDQUFDO0lBQ3RCLENBQUM7QUFDTCxDQUFDLENBQUE7QUFFRDs7R0FFRztBQUNRLGtCQUFVLEdBQUcsQ0FBQyxVQUFpQixFQUFDLG1CQUFtQixHQUFVLENBQUM7SUFDckUsRUFBRSxDQUFBLENBQUMsVUFBVSxJQUFJLGVBQWUsSUFBSSxDQUFDLG1CQUFtQixJQUFJLENBQUMsSUFBSSxrQkFBa0IsSUFBSSxtQkFBbUIsQ0FBQyxDQUFDLENBQUEsQ0FBQztRQUN6RyxrQkFBa0IsRUFBRSxDQUFDO0lBQ3pCLENBQUM7SUFBQyxJQUFJLENBQUMsQ0FBQztRQUNKLGtCQUFrQixHQUFHLENBQUMsQ0FBQztRQUN2QixlQUFlLEdBQUcsVUFBVSxDQUFDO1FBQzdCLFdBQUcsQ0FBQyxVQUFVLENBQUMsQ0FBQztJQUNwQixDQUFDO0FBQ0wsQ0FBQyxDQUFDO0FBQ0YsSUFBSSxlQUFlLEdBQVUsRUFBRSxDQUFDO0FBQ2hDLElBQUksa0JBQWtCLEdBQVUsQ0FBQyxDQUFDIn0=