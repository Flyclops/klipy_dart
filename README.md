# ⚠️ NOT MAINTAINED ⚠️
After exploring the option of using KLIPY we have decided against it.

If you are interested in taking over this repo and package please do not hesitate to reach out via the issues and we will get it sorted out.

# KLIPY Dart

<p align="center">
  <a href="https://pub.dartlang.org/packages/klipy_dart"><img src="https://img.shields.io/pub/v/klipy_dart.svg" alt="KLIPY Dart Pub Package" /></a>
  <a href="https://github.com/Flyclops/klipy_dart/actions/workflows/main.yml"><img src="https://github.com/flyclops/klipy_dart/actions/workflows/main.yml/badge.svg" alt="Build Status" /></a>
  <a href="https://coveralls.io/github/Flyclops/klipy_dart?branch=main"><img src="https://coveralls.io/repos/github/Flyclops/klipy_dart/badge.svg?branch=main" alt="Coverage Status" /></a>
  <a href="https://github.com/flyclops/klipy_dart/stargazers"><img src="https://img.shields.io/github/stars/flyclops/klipy_dart?style=flat" alt="KLIPY Dart Stars" /></a>
  <a href="https://github.com/Flyclops/klipy_dart/blob/main/LICENSE"><img src="https://img.shields.io/badge/License-BSD_3--Clause-blue.svg" alt="License BSD 3-Clause" /></a>
</p>

This package integrates [KLIPY GIF search](https://klipy.com) into [Dart](https://dart.dev/) by utilizing the [http](https://pub.dev/packages/http) package to communicate directly with the [KLIPY API](https://docs.klipy.com/getting-started). It is currently using the [migration from Tenor](https://docs.klipy.com/migrate-from-tenor) option.

Currently supported endpoints include: [search](https://docs.klipy.com/migrate-from-tenor/search), [featured](https://docs.klipy.com/migrate-from-tenor/features), [categories](https://docs.klipy.com/migrate-from-tenor/categories), [search suggestions](https://docs.klipy.com/migrate-from-tenor/search-suggestions), [autocomplete](https://docs.klipy.com/migrate-from-tenor/autocomplete), [trending search terms](https://docs.klipy.com/migrate-from-tenor/trending-search-terms), [register share](https://docs.klipy.com/migrate-from-tenor/register-share) and [posts](https://docs.klipy.com/migrate-from-tenor/posts).

<p align="center"><img src="https://github.com/flyclops/klipy_dart/raw/main/example/assets/demo.gif" width="200" alt="KLIPY Dart Demo"/></p>

<p align="center"><strong><sup>Show some ❤️ and <a href="https://github.com/flyclops/klipy_dart">star the repo</a> to support this package.</sup></strong></p>

## What to know

- In order to start using KLIPY Dart you must obtain an API key by registering your project with [KLIPY](https://docs.klipy.com/getting-started).
- KLIPY requires proper [attribution](https://docs.klipy.com/attribution) for projects using their API. This package does not handle the attribution process, so you will need to take care of it yourself.

## Obtaining KLIPY API key

1. Log in to the [partner panel](https://partner.klipy.com)
2. Add a [new platform](https://partner.klipy.com/api-keys)
3. Click `Create Key`
4. Copy the generated API key
5. Provide this API key as a parameter to `KlipyClient(apiKey: 'YOUR_API_KEY')`

## Usage

### Installation

```
dart pub add klipy_dart
```

<sup>Having trouble? Read the pub.dev <a href="https://pub.dev/packages/klipy_dart/install">installation page</a>.</sup>

### Import

Import the package into the dart file where it will be used:

```
import 'package:klipy_dart/klipy_dart.dart';
```

### Initialize

You must pass in a valid `apiKey` provided by [KLIPY](https://docs.klipy.com/getting-started).

If you would like to distinguish between projects/devices then consider creating seperate [API keys](https://partner.klipy.com/api-keys) under the same platform.

```
final klipyClient = KlipyClient(apiKey: 'YOUR_API_KEY');
```

## Example

For an example on each endpoint feel free to check out [example/lib/main.dart](https://github.com/Flyclops/klipy_dart/blob/main/example/lib/main.dart).

Here is how you can get 20 of the latest [featured](https://docs.klipy.com/migrate-from-tenor/features) GIFs and print the first one.

```
final klipyClient = KlipyClient(apiKey: 'YOUR_API_KEY');
final KlipyResponse? response = await klipyClient.featured(limit: 20);
final List<KlipyResultObject>? gifs = response?.results;
print(gifs?.first.media.tinygif?.url);
```

## Looking for a UI?

If you're seeking a ready-made UI solution, check out [KLIPY Flutter](https://github.com/Flyclops/klipy_flutter), which was designed based on the [Tenor SDK](https://developers.google.com/tenor/guides/quickstart#launch-search) [guidelines](https://developers.google.com/tenor/guides/attribution).

## What's next?

- Documentation
- Further improvements

## Contributing

If you read this far then you are awesome! There are a multiple ways in which you can [contribute](https://github.com/Flyclops/klipy_dart/blob/main/CONTRIBUTING.md):

- Pick up any issue marked with "[good first issue](https://github.com/flyclops/klipy_dart/issues?q=is:open+is:issue+label:%22good+first+issue%22)"
- Propose any feature, enhancement
- Report a bug
- Fix a bug
- Write and improve some documentation
- Send in a Pull Request 🙏
