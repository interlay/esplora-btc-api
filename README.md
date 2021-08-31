# [Blockstream Esplora](https://github.com/Blockstream/esplora) OpenAPI Spec & Clients

Built using [OpenAPI](https://github.com/OpenAPITools/openapi-generator). Requires [openapi-generator-cli](https://github.com/OpenAPITools/openapi-generator-cli).

```shell
make rust-client
make ts-client
```

## Typescript (Axios)

### Install

```bash
yarn install @interlay/esplora-btc-api
```

### Build

```bash
cd ts-client
yarn install
yarn build
```

### Examples

#### Get the current chain's best height

```typescript
import * as esplora from '@interlay/esplora-btc-api';

async function main() {
    let result = await new esplora.BlockApi().getLastBlockHeight();
    console.log(result.data);
}

main();
```

#### Get a raw block and extract the header

```typescript
import * as esplora from '@interlay/esplora-btc-api';

async function main() {
    const api = new esplora.BlockApi();
    const result = await api.getBlockRaw("$HASH", {responseType: 'arraybuffer'});
    console.log(result.data.slice(0, 80).toString('hex'));
}

main();
```