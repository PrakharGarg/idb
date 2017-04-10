import "typings-global";
/**
 * logs an info to console
 * @param logText
 * @returns {boolean}
 */
export declare let log: (logText: any) => void;
export declare let info: (logText: any) => void;
/**
 * logs an 'OK!' message to console
 * @param logText
 * @returns {boolean}
 */
export declare let ok: (logText: any) => void;
/**
 * logs a success to console
 * @param logText string to log as error
 * @returns {boolean}
 */
export declare let success: (logText: any) => void;
/**
 * logs a 'warn:' message to console
 * @param logText string to log as error
 * @returns {boolean}
 */
export declare let warn: (logText: any) => void;
/**
 * logs an error to console
 * @param logText
 * @returns {boolean}
 */
export declare let error: (logText: any) => void;
/**
 * logs an directory to console
 * @param logText
 * @returns {boolean}
 */
export declare let dir: (logText: any) => void;
/**
 * creates a new empty line
 * @param linesArg
 * @returns void
 */
export declare let newLine: (linesArg?: number) => void;
/**
 * logs a reduced log that only logs changes of consequential log messages
 */
export declare let logReduced: (logTextArg: string, repeatEveryTimesArg?: number) => void;
