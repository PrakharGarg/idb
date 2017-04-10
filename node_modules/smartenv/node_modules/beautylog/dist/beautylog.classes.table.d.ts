export declare class Table {
    tableHead: string[];
    rows: any;
    type: string;
    constructor(tableTypeArg: string, tableHeadArrayArg?: string[]);
    push(row: string[]): void;
    print(): void;
}
