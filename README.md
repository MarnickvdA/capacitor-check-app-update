<h3 align="center">⛔️ DISCONTINUED ⛔️Capacitor Check App Update</h3>
<p align="center"><strong><code>@abitofsoftware/capacitor-check-app-update</code></strong></p>
<p align="center">
  Capacitor plugin to check for app updates in the App/Play store
</p>

<p align="center">
  <img src="https://img.shields.io/maintenance/yes/2020?style=flat-square" />
  <a href="https://www.npmjs.com/package/@abitofsoftware/capacitor-check-app-update"><img src="https://img.shields.io/npm/l/@abitofsoftware/capacitor-check-app-update?style=flat-square" /></a>
<br>
  <a href="https://www.npmjs.com/package/@abitofsoftware/capacitor-check-app-update"><img src="https://img.shields.io/npm/dw/@abitofsoftware/capacitor-check-app-update?style=flat-square" /></a>
  <a href="https://www.npmjs.com/package/@abitofsoftware/capacitor-check-app-update"><img src="https://img.shields.io/npm/v/@abitofsoftware/capacitor-check-app-update?style=flat-square" /></a>
  <!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
<a href="#contributors"><img src="https://img.shields.io/badge/all%20contributors-1-orange?style=flat-square" /></a>
<!-- ALL-CONTRIBUTORS-BADGE:END -->
</p>

## Maintainers

| Maintainer   | GitHub                                | Social                                          |
| ------------ | ------------------------------------- | ----------------------------------------------- |
| Marnick van der Arend | [MarnickvdA](https://github.com/marnickvda) | - |

## Notice 🚀

This plugin only works for production builds.

## Installation

Using npm:

```bash
npm install @abitofsoftware/capacitor-check-app-update
```

Sync native files:

```bash
npx cap sync
```

Check App Updates for iOS and Android

> work in progress

## Roadmap

### ios

- [x] canUpdate

### android

- [x] canUpdate

### web

- [ ] canUpdate

## API

- `canUpdate({locale:string}): Promise<{ value:string }>`

## Usage

```js
import {CheckAppUpdate} from "@abitofsoftware/capacitor-check-app-update";
const checkAppUpdate = new CheckAppUpdate();

if(ENV.production) {
  checkAppUpdate.canUpdate({locale: 'nl'})
          .then((updateAvailable) => {
            if (updateAvailable.value) {
              console.log('Update available!');
            } else {
              console.log('No update available');
            }
          });
}
```

## iOS setup

- `ionic start my-cap-app --capacitor`
- `cd my-cap-app`
- `npm install --save @abitofsoftware/capacitor-check-app-update`
- `mkdir www && touch www/index.html`
- `sudo gem install cocoapods` (only once)
- `npx cap add ios`
- `npx cap sync ios` (every time you run `npm install`)
- `npx cap open ios`

> Tip: every time you change a native code you may need to clean up the cache (Product > Clean build folder) and then run the app again.

## Android setup

- `ionic start my-cap-app --capacitor`
- `cd my-cap-app`
- `npm install --save @abitofsoftware/capacitor-check-app-update`
- `mkdir www && touch www/index.html`
- `npx cap add android`
- `npx cap sync android` (every time you run `npm install`)
- `npx cap open android`
- `[extra step]` in android case we need to tell Capacitor to initialise the plugin:

> on your `MainActivity.java` file add `import com.abitofsoftware.checkappupdate.CheckAppUpdatePlugin;` and then inside the init callback `add(CheckAppUpdatePlugin.class);`

Now you should be set to go. Try to run your client using `ionic cap run android --livereload --address=0.0.0.0`.

> Tip: every time you change a native code you may need to clean up the cache (Build > Clean Project | Build > Rebuild Project) and then run the app again.

## Updating

For existing projects you can upgrade all capacitor related packages (including this plugin) with this single command

`npx npm-upgrade '*capacitor*' && npm install`

## License

MIT
