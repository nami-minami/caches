import type {
    ContextBuilder,
    ExtOptions,
    Plugin,
} from "@shougo/dpp-vim/types";
import {
    BaseConfig,
    type ConfigReturn,
    type MultipleHook,
} from "@shougo/dpp-vim/config";
import {
    Protocol,
} from "@shougo/dpp-vim/protocol";
import {
    mergeFtPlugins,
} from "@shougo/dpp-vim/utils";

import type {
    Ext as TomlExt,
    Params as TomlParams,
} from "@shougo/dpp-ext-toml";

import type {
    Denops,
} from "@denops/std";

import * as fn from "@denops/std/function";

export class Config extends BaseConfig {
    override async config(args: {
        denops: Denops,
        contextBuilder: ContextBuilder,
        basePath: string,

    }): Promise<ConfigReturn> {
        args.contextBuilder.setGlobal({
            extParams: {
                protocols: ['git'],
            },
        });

        const [context, options] = await args.contextBuilder.get(args.denops);

        const protocols = await args.denops.dispatcher.getProtocols() as Record<
            string,
            Protocol
        >;

        const recordPlugins: Record<string, Plugin> = {};

        const ftPlugins: Record<string. string> = {};

        const hooksFiles: string[] = [];

        let multipleHook: MultipleHook = {};

        const [tomlExt, tomlOptions, tomlParams]: [
            tomlExt | undefined,
            ExtOptions,
            TomlParams,
        ] = await args.denops.dispatcher.getExt(
            'toml',
        ) as [
            TomlExt | undefined,
            ExtOptions,
            TomlParams,
        ];

        if (tomlExt) {
            const action = tomlExt.actions.load;
        }

        return {
        };
    }
}
