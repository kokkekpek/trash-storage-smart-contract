# TrashStorage
Generates random numbers and save into the array.

## Deploy
### Create config for lfd network
```sh
tonos-cli config --url gql.custler.net
```

### Compile and deploy TrashStorage
```sh
solc TrashStorage.sol
tvm_linker compile TrashStorage.code --lib /home/noop/Projects/TON-Solidity-Compiler/lib/stdlib_sol.tvm
rename "s/[0123456789abcdef]{64}\.tvc/TrashStorage\.tvc/" *.tvc
tonos-cli genaddr TrashStorage.tvc TrashStorage.abi.json --genkey TrashStorage.keys.json
tonos-cli deploy TrashStorage.tvc '{}' --abi TrashStorage.abi.json --sign TrashStorage.keys.json
```

### Compile and deploy Spammer
```sh
solc Spammer.sol
tvm_linker compile Spammer.code --lib /home/noop/Projects/TON-Solidity-Compiler/lib/stdlib_sol.tvm
rename "s/[0123456789abcdef]{64}\.tvc/Spammer\.tvc/" *.tvc
tonos-cli genaddr Spammer.tvc Spammer.abi.json --genkey Spammer.keys.json
tonos-cli deploy Spammer.tvc '{}' --abi Spammer.abi.json --sign Spammer.keys.json
```

### Call spammer
* **0:SSSS** - replace to spammer address
* **0:TTTT** - replace to trash storage address
```sh
tonos-cli call '0:SSSS' save '{"addr":"0:TTTT","kiloBytes":10}' --abi Spammer.abi.json --sign Spammer.keys.json
```

### Call trash storage manualy
```sh
tonos-cli call '0:TTTT' save1KB '{}' --abi TrashStorage.abi.json --sign TrashStorage.keys.json
```

### Get info from trash storage
```sh
tonos-cli run '0:TTTT' info '{}' --abi TrashStorage.abi.json
```



## Deployment tools
```sh
solc, the solidity compiler commandline interface
Version: 0.6.3-develop.2020.12.13+commit.54c8a5a1.mod.Linux.g++
```

```sh
TVM linker 0.1.0
COMMIT_ID: 2e15070e458637add2ecb279a03bd88d8df37bde
BUILD_DATE: 2020-12-13 03:25:46 +0300
COMMIT_DATE: 2020-11-20 10:57:07 +0300
```

```sh
tonos_cli 0.1.28
COMMIT_ID: a389881108384118ba1a565a0450762fdabeb705
BUILD_DATE: 2020-12-13 03:41:14 +0300
COMMIT_DATE: 2020-11-30 17:42:19 +0300
```