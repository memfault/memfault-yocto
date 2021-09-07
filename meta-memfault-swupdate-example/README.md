# meta-memfault-swupdate-example

> ⚠️ This repository is a configuration example. For your own project, we
> recommend that you fork this repository and modify it to fit your needs.

This repository is based on [sbabic/meta-swupdate-boards][1] and contains
[Memfault][2]-specific [Yocto][3] setups to run [SWUpdate][4] in [Suricatta
daemon mode][5], using Memfault's OTA capabilities as a payload server.

[1]: https://github.com/sbabic/meta-swupdate-boards
[2]: https://memfault.com/
[3]: https://www.yoctoproject.org/
[4]: https://sbabic.github.io/swupdate
[5]: https://sbabic.github.io/swupdate/suricatta.html

Read
[documentation on Memfault support for Linux](https://docs.memfault.com/docs/linux/introduction).

## Dependencies

This layer depends on:

```
git://git.openembedded.org/bitbake
git://git.openembedded.org/openembedded-core
```

or

```
git://git.yoctoproject.org/poky
```

and

```
git://github.com/sbabic/meta-swupdate.git
```

## Sample

A full setup that uses this layer can be found in
[`Dockerfile.swupdate`](/Dockerfile.swupdate).

## Usage

This layer contains two main recipes: `swupdate` and `update-image`.

To build a valid `.swu` file for your device, run:

```
bitbake update-image
```

Remember to set `MACHINE` to a valid value. For example, this layer provides a
sample implementation for `qemuarm`.

### `swupdate`

This recipe appends to the base
[`meta-swupdate/swupdate`](https://github.com/sbabic/meta-swupdate) recipe and
sets up the target device SWUpdate installation to use its Suricatta daemon mode
and connect to Memfault servers to poll for updates.

It takes care of:

- Copying `swupdate.cfg` into (e.g.) `/etc/swupdate.cfg` so that SWUpdate picks
  it up.
- Copying `09-swupdate-args` into (e.g.)
  `/usr/lib/swupdate/conf.d/09-swupdate-args`. This script ensures Suricatta is
  invoked with the correct parameters, and updates the `$` placeholders with the
  correct values. The sample script that implements this (also in
  `09-swupdate-args`) is unlikely to work on all boards, so make sure to update
  it for your use-case.

### `update-image`

The `update-image` recipe will produce a `.swu` file suitable for usage with
SWUpdate on a target device.

The most important file in this recipe is `sw-description`. The included example
is very basic and you will need to implement one that suits your project. To do
this, it's useful to [read SWUpdate's documentation page on
`sw-description`][6].

[6]: https://sbabic.github.io/swupdate/sw-description.html

### Other recipes

- `recipes-core/init-ifupdown`: overrides `/etc/network/interfaces` to make DNS
  work inside QEMU.
