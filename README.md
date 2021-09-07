# memfault-yocto

This repository contains [Memfault](https://memfault.com/)-specific
[Yocto](https://www.yoctoproject.org/) layers and example configurations.

- [`meta-memfault-swupdate-example`](/meta-memfault-swupdate-example): this
  layer is based on [sbabic/meta-swupdate-boards][1] and contains
  [Memfault][2]-specific [Yocto][3] setups to run [SWUpdate][4] in [Suricatta
  daemon mode][5], using Memfault's OTA capabilities as a payload server.

[1]: https://github.com/sbabic/meta-swupdate-boards
[2]: https://memfault.com/
[3]: https://www.yoctoproject.org/
[4]: https://sbabic.github.io/swupdate
[5]: https://sbabic.github.io/swupdate/suricatta.html

Read
[documentation on Memfault support for Linux](https://docs.memfault.com/docs/linux/introduction).
