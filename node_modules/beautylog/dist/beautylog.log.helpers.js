"use strict";
const plugins = require("./beautylog.plugins");
const beautylog_console_1 = require("./beautylog.console");
const beautylog_remote_1 = require("./beautylog.remote");
/**
 *
 * @param logText
 * @param logType
 * @returns {boolean}
 */
exports.internalLog = function (logType = 'normal', logText = 'empty log') {
    switch (plugins.smartenv.getEnv().runtimeEnv) {
        case "node":
            exports.logNode(logType, logText);
            beautylog_remote_1.remoteLog(logType, logText);
            break;
        case "browser":
            logBrowser(logText, logType);
            break;
        default:
            console.log("something is strange about the platform in which you try to use beautylog");
            break;
    }
    ;
};
let localBl = {
    dirPrefix: plugins.clc.bgXterm(39).xterm(231).bold(' DIR ') + ' ',
    errorPrefix: ' Error: '.bgRed.white.bold + ' ',
    infoPrefix: plugins.clc.bgXterm(198).xterm(231).bold(' INFO ') + ' ',
    normalPrefix: ' Log: '.bgCyan.white.bold + ' ',
    okPrefix: ' '.bgGreen + ' OK! '.bgBlack.green.bold + ' ',
    successPrefix: ' Success: '.bgGreen.white.bold + ' ',
    warnPrefix: ' '.bgYellow + ' Warn: '.bgBlack.yellow.bold + ' '
};
exports.logNode = function (logType, logText) {
    try {
        switch (logType) {
            case 'dir':
                logText = localBl.dirPrefix + plugins.clc.xterm(26)(logText);
                break;
            case 'error':
                logText = localBl.errorPrefix + logText.red.bold;
                break;
            case 'info':
                logText = localBl.infoPrefix + plugins.clc.xterm(198)(logText);
                break;
            case 'normal':
                logText = localBl.normalPrefix + logText.cyan.bold;
                break;
            case 'ok':
                logText = localBl.okPrefix + logText.bold;
                break;
            case 'success':
                logText = localBl.successPrefix + logText.green.bold;
                break;
            case 'warn':
                logText = localBl.warnPrefix + logText.bold;
                break;
            case 'log':
                logText = localBl.normalPrefix + logText.blue.bold;
                break;
            default:
                logText.blue.bold;
                console.log(('unknown logType for "' + logText + '"').red.bold);
                break;
        }
        beautylog_console_1.beautyConsole.log(logText);
        return true;
    }
    catch (error) {
        console.log(localBl.errorPrefix + 'You seem to have tried logging something strange'.red.bold + error);
        return false;
    }
};
let logBrowser = function (logText, logType) {
    switch (logType) {
        case 'dir':
            logText = localBl.dirPrefix + plugins.clc.xterm(26)(logText);
            break;
        case 'error':
            logText = localBl.errorPrefix + logText.red.bold;
            break;
        case 'info':
            console.log('%c Info: %c ' + logText, 'background:#EC407A;color:#ffffff;', 'color:#EC407A;');
            break;
        case 'normal':
            logText = localBl.normalPrefix + logText.cyan.bold;
            break;
        case 'ok':
            console.log('%c OK: %c ' + logText, "background:#000000;color:#8BC34A;", "color:#000000;");
            break;
        case 'success':
            console.log('%c Success: %c ' + logText, "background:#8BC34A;color:#ffffff;", "color:#8BC34A;");
            break;
        case 'warn':
            console.log('%c Warn: %c ' + logText, "background:#000000;color:#FB8C00;", "color:#000000;");
            break;
        case 'log':
            console.log('%c Log: %c ' + logText, "background:#42A5F5;color:#ffffff", "color:#42A5F5;");
            break;
        default:
            console.log('unknown logType for "' + logText + '"');
            break;
    }
};
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiYmVhdXR5bG9nLmxvZy5oZWxwZXJzLmpzIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXMiOlsiLi4vdHMvYmVhdXR5bG9nLmxvZy5oZWxwZXJzLnRzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiI7QUFBQSxNQUFZLE9BQU8sV0FBTSxxQkFBcUIsQ0FBQyxDQUFBO0FBQy9DLG9DQUE4QixxQkFBcUIsQ0FBQyxDQUFBO0FBQ3BELG1DQUF3QixvQkFBb0IsQ0FBQyxDQUFBO0FBRTdDOzs7OztHQUtHO0FBQ1EsbUJBQVcsR0FBRyxVQUFVLE9BQU8sR0FBVyxRQUFRLEVBQUUsT0FBTyxHQUFXLFdBQVc7SUFDeEYsTUFBTSxDQUFDLENBQUMsT0FBTyxDQUFDLFFBQVEsQ0FBQyxNQUFNLEVBQUUsQ0FBQyxVQUFVLENBQUMsQ0FBQSxDQUFDO1FBQzFDLEtBQUssTUFBTTtZQUNQLGVBQU8sQ0FBQyxPQUFPLEVBQUMsT0FBTyxDQUFDLENBQUM7WUFDekIsNEJBQVMsQ0FBQyxPQUFPLEVBQUMsT0FBTyxDQUFDLENBQUM7WUFDM0IsS0FBSyxDQUFDO1FBQ1YsS0FBSyxTQUFTO1lBQ1YsVUFBVSxDQUFDLE9BQU8sRUFBRSxPQUFPLENBQUMsQ0FBQztZQUM3QixLQUFLLENBQUM7UUFDVjtZQUNJLE9BQU8sQ0FBQyxHQUFHLENBQUMsMkVBQTJFLENBQUMsQ0FBQztZQUN6RixLQUFLLENBQUM7SUFDZCxDQUFDO0lBQUEsQ0FBQztBQUNOLENBQUMsQ0FBQztBQUVGLElBQUksT0FBTyxHQUFHO0lBQ1YsU0FBUyxFQUFFLE9BQU8sQ0FBQyxHQUFHLENBQUMsT0FBTyxDQUFDLEVBQUUsQ0FBQyxDQUFDLEtBQUssQ0FBQyxHQUFHLENBQUMsQ0FBQyxJQUFJLENBQUMsT0FBTyxDQUFDLEdBQUcsR0FBRztJQUNqRSxXQUFXLEVBQUUsVUFBVSxDQUFDLEtBQUssQ0FBQyxLQUFLLENBQUMsSUFBSSxHQUFHLEdBQUc7SUFDOUMsVUFBVSxFQUFFLE9BQU8sQ0FBQyxHQUFHLENBQUMsT0FBTyxDQUFD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