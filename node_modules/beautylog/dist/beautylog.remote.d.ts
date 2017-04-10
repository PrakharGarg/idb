export declare let remoteLog: (logType: string, logMessage: string) => void;
export declare let remote: {
    loggly: (optionsArg: {
        token: string;
        subdomain: string;
        appName: string;
        serverName: string;
    }) => void;
};
