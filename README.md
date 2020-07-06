# [Blockstream Esplora](https://github.com/Blockstream/esplora) Client

Built using [OpenAPI](https://github.com/OpenAPITools/openapi-generator).

## Install

```bash
yarn install @interlay/esplora-btc-api
```

## Build

```bash
yarn build && tsc
```

## Examples

```typescript
import * as esplora from './src/index';

async function main() {
    let result = await new esplora.BlockApi().getLastBlockHeight();
    console.log(result.data);
}

main();
```