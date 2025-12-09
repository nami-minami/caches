import {
    type ActionArguments,
    ActionFrags,
    type DduOptions,
} from "@shougo/ddu-vim/types";
import {
    BaseConfig,
    type ConfigArguments,
} from "@shougo/ddu-vim/config";
import type {
    ActionData,
} from "@shougo/ddu-kind-file";
import type {
    Params as FtParams,
} from "@shougo/ddu-ui-ff";
import type {
    Params as FilerParams,
} from "@shougo/ddu-ui-filer";

import {
    Denops,
} from "@denops/std";
import * as fn from "@denops/std/function";

type Params = Record<string, unknown>;

type DduAction = {
    path: string,
    __name: string,
}

export class Config extends BaseConfig {
    override config(args: ConfigArguments): Promise<void> {
        args.setAlias("_", "source", "file_rg", "file_external");
        args.setAlias("_", "source", "file_git", "file_external");
        args.setAlias(
          "_",
          "filter",
          "matcher_ignore_current_buffer",
          "matcher_ignores",
        );
        args.setAlias("_", "action", "tabopen", "open");

        args.contextBuilder.patchGlobal({
            ui: "ff",
            sourceOptions: {
                "-": {
                    "columns": [
                        "filename",
                    ],
                },
            },
            kindOptions: {
                "file": {
                    "defaultAction": "open",
                },
            },
            uiParams: {
                "filer": {
                    "winWidth": 40,
                    "split": "vertical",
                    "splitDirection": "topleft",
                },
            },
        })

        return Promise.resolve();
    }
}
