export { log } from "./beautylog.log.helpers";
/**
 * logs an info to console
 * @param logText
 * @returns {boolean}
 */
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
