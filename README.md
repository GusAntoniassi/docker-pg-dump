# pgdump

Usage:
```
	$~ docker run --rm -it -v $PWD:/output pgdump
```

Run pg_dumpall instead with `-e DUMPALL`

You can also pass credentials with environment variables, like so:
```
	$~ docker run --rm -it \
		-e HOST=localhost \
		-e USERNAME=postgres \
		-e PORT=5432 \
		-e DATABASE=postgres \
		-v $PWD:/output \
		pgdump
```