export declare class Ora {
    private _oraObject;
    state: string;
    constructor(textArg: string, colorArg: string, startArg?: boolean);
    text(textArg: any): void;
    start(textArg?: string, colorArg?: string): void;
    end(): void;
    endOk(textArg: any): void;
    endError(textArg: any): void;
    stop(): void;
    log(logText: string, logType: string): void;
}
