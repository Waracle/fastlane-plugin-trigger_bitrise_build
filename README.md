# trigger_bitrise_build plugin

[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-trigger_bitrise_build)

[![Gem Version](https://badge.fury.io/rb/fastlane-plugin-trigger_bitrise_build.svg)](https://badge.fury.io/rb/fastlane-plugin-trigger_bitrise_build)

## Getting Started

This project is a [_fastlane_](https://github.com/fastlane/fastlane) plugin. To get started with `fastlane-plugin-trigger_bitrise_build`, add it to your project by running:

```bash
fastlane add_plugin trigger_bitrise_build
```

## About trigger_bitrise_build

Trigger a [Bitrise](https://bitrise.io) build from Fastlane

Bitrise is a Continuous Integration and Delivery (CI/CD) Platform as a Service (PaaS) with a main focus on mobile app development (iOS, Android, Xamarin, ...).  It has the ability to programmatically trigger new builds using the [build trigger API](http://devcenter.bitrise.io/api/build-trigger/).  This fastlane plugin is simply a wrapper for the trigger API.

## Example

A [bitrise](https://www.bitrise.io/users/sign_up) account is  *required*.  Once you have created an account and added an application, check out the [example `Fastfile`](fastlane/Fastfile) to see how to use this plugin. Try it by cloning the repo, running `fastlane install_plugins` and `bundle exec fastlane test`.


## Run tests for this plugin

To run both the tests, and code style validation, run

```
rake
```

To automatically fix many of the styling issues, use
```
rubocop -a
```

## Issues and Feedback

For any other issues and feedback about this plugin, please submit it to this repository.

## Troubleshooting

If you have trouble using plugins, check out the [Plugins Troubleshooting](https://docs.fastlane.tools/plugins/plugins-troubleshooting/) guide.

## Using _fastlane_ Plugins

For more information about how the `fastlane` plugin system works, check out the [Plugins documentation](https://docs.fastlane.tools/plugins/create-plugin/).

## About _fastlane_

_fastlane_ is the easiest way to automate beta deployments and releases for your iOS and Android apps. To learn more, check out [fastlane.tools](https://fastlane.tools).
