/// <reference path="./typings/main.d.ts" />
"use strict";
var beautylog_log_helpers_1 = require("./beautylog.log.helpers");
var beautylog_log_helpers_2 = require("./beautylog.log.helpers");
exports.log = beautylog_log_helpers_2.log;
/**
 * logs an info to console
 * @param logText
 * @returns {boolean}
 */
exports.info = function (logText) {
    return beautylog_log_helpers_1.log(logText, 'info');
};
/**
 * logs an 'OK!' message to console
 * @param logText
 * @returns {boolean}
 */
exports.ok = function (logText) {
    return beautylog_log_helpers_1.log(logText, 'ok');
};
/**
 * logs a success to console
 * @param logText string to log as error
 * @returns {boolean}
 */
exports.success = function (logText) {
    return beautylog_log_helpers_1.log(logText, 'success');
};
/**
 * logs a 'warn:' message to console
 * @param logText string to log as error
 * @returns {boolean}
 */
exports.warn = function (logText) {
    return beautylog_log_helpers_1.log(logText, 'warn');
};
/**
 * logs an error to console
 * @param logText
 * @returns {boolean}
 */
exports.error = function (logText) {
    return beautylog_log_helpers_1.log(logText, 'error');
};
/**
 * logs an directory to console
 * @param logText
 * @returns {boolean}
 */
exports.dir = function (logText) {
    return beautylog_log_helpers_1.log(logText, 'dir');
};

//# sourceMappingURL=data:application/json;charset=utf8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbImJlYXV0eWxvZy5sb2cudHMiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6IkFBQUEsNENBQTRDOztBQUU1QyxzQ0FBa0IseUJBQXlCLENBQUMsQ0FBQTtBQUM1QyxzQ0FBa0IseUJBQXlCLENBQUM7QUFBcEMsMENBQW9DO0FBRTVDOzs7O0dBSUc7QUFDUSxZQUFJLEdBQUcsVUFBVSxPQUFPO0lBQy9CLE1BQU0sQ0FBQywyQkFBRyxDQUFDLE9BQU8sRUFBRSxNQUFNLENBQUMsQ0FBQztBQUNoQyxDQUFDLENBQUM7QUFFRjs7OztHQUlHO0FBQ1EsVUFBRSxHQUFHLFVBQVUsT0FBTztJQUM3QixNQUFNLENBQUMsMkJBQUcsQ0FBQyxPQUFPLEVBQUUsSUFBSSxDQUFDLENBQUM7QUFDOUIsQ0FBQyxDQUFDO0FBRUY7Ozs7R0FJRztBQUNRLGVBQU8sR0FBRyxVQUFVLE9BQU87SUFDbEMsTUFBTSxDQUFDLDJCQUFHLENBQUMsT0FBTyxFQUFFLFNBQVMsQ0FBQyxDQUFDO0FBQ25DLENBQUMsQ0FBQztBQUVGOzs7O0dBSUc7QUFDUSxZQUFJLEdBQUcsVUFBVSxPQUFPO0lBQy9CLE1BQU0sQ0FBQywyQkFBRyxDQUFDLE9BQU8sRUFBRSxNQUFNLENBQUMsQ0FBQztBQUNoQyxDQUFDLENBQUM7QUFFRjs7OztHQUlHO0FBQ1EsYUFBSyxHQUFHLFVBQVUsT0FBTztJQUNoQyxNQUFNLENBQUMsMkJBQUcsQ0FBQyxPQUFPLEVBQUUsT0FBTyxDQUFDLENBQUM7QUFDakMsQ0FBQyxDQUFDO0FBRUY7Ozs7R0FJRztBQUNRLFdBQUcsR0FBRyxVQUFVLE9BQU87SUFDOUIsTUFBTSxDQUFDLDJCQUFHLENBQUMsT0FBTyxFQUFFLEtBQUssQ0FBQyxDQUFDO0FBQy9CLENBQUMsQ0FBQyIsImZpbGUiOiJiZWF1dHlsb2cubG9nLmpzIiwic291cmNlc0NvbnRlbnQiOlsiLy8vIDxyZWZlcmVuY2UgcGF0aD1cIi4vdHlwaW5ncy9tYWluLmQudHNcIiAvPlxuXG5pbXBvcnQge2xvZ30gZnJvbSBcIi4vYmVhdXR5bG9nLmxvZy5oZWxwZXJzXCI7XG5leHBvcnQge2xvZ30gZnJvbSBcIi4vYmVhdXR5bG9nLmxvZy5oZWxwZXJzXCI7XG5cbi8qKlxuICogbG9ncyBhbiBpbmZvIHRvIGNvbnNvbGVcbiAqIEBwYXJhbSBsb2dUZXh0XG4gKiBAcmV0dXJucyB7Ym9vbGVhbn1cbiAqL1xuZXhwb3J0IGxldCBpbmZvID0gZnVuY3Rpb24gKGxvZ1RleHQpIHtcbiAgICByZXR1cm4gbG9nKGxvZ1RleHQsICdpbmZvJyk7XG59O1xuXG4vKipcbiAqIGxvZ3MgYW4gJ09LIScgbWVzc2FnZSB0byBjb25zb2xlXG4gKiBAcGFyYW0gbG9nVGV4dFxuICogQHJldHVybnMge2Jvb2xlYW59XG4gKi9cbmV4cG9ydCBsZXQgb2sgPSBmdW5jdGlvbiAobG9nVGV4dCkge1xuICAgIHJldHVybiBsb2cobG9nVGV4dCwgJ29rJyk7XG59O1xuXG4vKipcbiAqIGxvZ3MgYSBzdWNjZXNzIHRvIGNvbnNvbGVcbiAqIEBwYXJhbSBsb2dUZXh0IHN0cmluZyB0byBsb2cgYXMgZXJyb3JcbiAqIEByZXR1cm5zIHtib29sZWFufVxuICovXG5leHBvcnQgbGV0IHN1Y2Nlc3MgPSBmdW5jdGlvbiAobG9nVGV4dCkge1xuICAgIHJldHVybiBsb2cobG9nVGV4dCwgJ3N1Y2Nlc3MnKTtcbn07XG5cbi8qKlxuICogbG9ncyBhICd3YXJuOicgbWVzc2FnZSB0byBjb25zb2xlXG4gKiBAcGFyYW0gbG9nVGV4dCBzdHJpbmcgdG8gbG9nIGFzIGVycm9yXG4gKiBAcmV0dXJucyB7Ym9vbGVhbn1cbiAqL1xuZXhwb3J0IGxldCB3YXJuID0gZnVuY3Rpb24gKGxvZ1RleHQpIHtcbiAgICByZXR1cm4gbG9nKGxvZ1RleHQsICd3YXJuJyk7XG59O1xuXG4vKipcbiAqIGxvZ3MgYW4gZXJyb3IgdG8gY29uc29sZVxuICogQHBhcmFtIGxvZ1RleHRcbiAqIEByZXR1cm5zIHtib29sZWFufVxuICovXG5leHBvcnQgbGV0IGVycm9yID0gZnVuY3Rpb24gKGxvZ1RleHQpIHtcbiAgICByZXR1cm4gbG9nKGxvZ1RleHQsICdlcnJvcicpO1xufTtcblxuLyoqXG4gKiBsb2dzIGFuIGRpcmVjdG9yeSB0byBjb25zb2xlXG4gKiBAcGFyYW0gbG9nVGV4dFxuICogQHJldHVybnMge2Jvb2xlYW59XG4gKi9cbmV4cG9ydCBsZXQgZGlyID0gZnVuY3Rpb24gKGxvZ1RleHQpIHtcbiAgICByZXR1cm4gbG9nKGxvZ1RleHQsICdkaXInKTtcbn07Il19
