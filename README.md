meandmymonkey/satis
===================

A docker base image for [Satis](https://github.com/composer/satis).

For a complete Satis image, you will need to build a container image
inheriting from this one. Besides adding ```/etc/satis.json```,
you will need to do one of two things:

- create a cron job (and run cron!) to run regular Satis updates
- run a single Satis update when building your container image - this will result in a static/fixed package archive
