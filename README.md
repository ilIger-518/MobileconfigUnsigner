# ProfileUnsigner

A tiny macOS droplet app that strips the signature from a signed `.mobileconfig` profile. Drag a profile onto it and an unsigned copy is created next to the original.

It does exactly what this command does:

```sh
security cms -D -i 'Profile.mobileconfig' > 'Profile Unsigned.mobileconfig'
```

## Build

Requires macOS (uses `osacompile` and `security`, both built in).

```sh
./build.sh
```

This produces `ProfileUnsigner.app` in the repository folder. Move it wherever you like, e.g. `/Applications` or the Dock.

## Usage

- **Drag and drop:** drag one or more `.mobileconfig` files onto `ProfileUnsigner.app`.
- **Double-click:** the app opens a file picker instead.

For `Foo.mobileconfig`, the output is `Foo Unsigned.mobileconfig` in the same folder. An existing file with that name is overwritten. A dialog lists the files created and any failures (for example, a profile that is not signed).

## Notes

- The first launch may require right-click → Open, since the app is not notarized.
- The original profile is never modified.
- Unsigned profiles may behave differently when installed (e.g. they can't be verified as coming from your MDM), so only use them where that's acceptable.

## License

[MIT](LICENSE)

## Files

- `ProfileUnsigner.applescript`: the droplet source.
- `build.sh`: compiles the source into `ProfileUnsigner.app`.
