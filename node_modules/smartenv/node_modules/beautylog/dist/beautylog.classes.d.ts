import { Table } from "./beautylog.classes.table";
import { Ora } from "./beautylog.classes.ora";
export declare let table: (tableTypeArg: string, tableHeadArrayArg?: string[]) => Table;
export declare let ora: (textArg: string, colorArg: string, startArg?: boolean) => Ora;
