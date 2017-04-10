import "typings-global";
export declare let oraActive: boolean;
export declare let activeOra: Ora;
export declare class Ora {
    private _oraObject;
    state: string;
    constructor(textArg: string, colorArg: string, startArg?: boolean);
    text(textArg: any): void;
    start(textArg?: string, colorArg?: string): void;
    end(): void;
    endOk(textArg: any): void;
    endError(textArg: any): void;
    pause(): void;
    stop(): void;
}
